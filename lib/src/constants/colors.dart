import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/features/settings/application/controllers/settings_controller.dart';

enum ThemeSeed {
  blue(0xFF2196F3),
  green(0xFF4CAF50),
  yellow(0xFFFFEB3B),
  orange(0xFFFF9800),
  deepOrange(0xFFFF5722),
  amber(0xFFFFC107),
  cyan(0xFF00BCD4),
  indigo(0xFF3F51B5),
  pink(0xFFE91E63),
  purple(0xFF9C27B0),
  red(0xFFF44336),
  teal(0xFF009688);

  const ThemeSeed(this.value);
  final int value;
}

// waiting for: https://github.com/flutter/flutter/issues/115912
Color surfaceContainerLight(int color) =>
    Color(CorePalette.of(color).neutralVariant.get(94));
Color surfaceContainerDark(int color) => Color(
      CorePalette.of(color).neutralVariant.get(18),
    );

Color surfaceContainer(WidgetRef ref) {
  final appTheme = ref.watch(settingsControllerProvider.select(
    (value) => value.requireValue.theme,
  ));

  return appTheme.brightness == Brightness.light
      ? surfaceContainerLight(appTheme.seed.value)
      : surfaceContainerDark(appTheme.seed.value);
}

final shimmerLightBaseColor = Colors.white.withAlpha(100);
shimmerDarkBaseColor(WidgetRef ref) => surfaceContainer(ref).withAlpha(150);

shimmerLightHighlightColor(WidgetRef ref) => surfaceContainer(ref).withAlpha(1);
shimmerDarkHighlightColor(WidgetRef ref) => surfaceContainer(ref).withAlpha(50);
