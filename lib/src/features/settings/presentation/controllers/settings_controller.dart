import 'package:flutter/widgets.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'settings_controller.g.dart';

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  FutureOr<Settings> build() {
    return ref.read(settingsRepositoryProvider).get();
  }

  Future<void> setLocale(Locale? locale) async {
    final settings = await future;

    state = await AsyncValue.guard(() async {
      final newSettings = settings.copyWith(locale: locale?.toAppLocale());

      await ref.read(settingsRepositoryProvider).update(newSettings);

      return newSettings;
    });
  }

  Future<void> setTheme(AppTheme theme) async {
    final settings = await future;

    state = await AsyncValue.guard(() async {
      final newSettings = settings.copyWith(
        theme: theme,
      );

      await ref.read(settingsRepositoryProvider).update(newSettings);

      return newSettings;
    });
  }

  Future<void> clear() async {
    state = await AsyncValue.guard(() async {
      await ref.read(settingsRepositoryProvider).clear();

      return const Settings();
    });
  }
}
