import 'package:flutter/widgets.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/settings/settings.dart';

part 'settings_controller.g.dart';

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  FutureOr<Settings> build() {
    return ref.read(settingsRepositoryProvider).get();
  }

  Future<void> setLocale(Locale? locale) async {
    final settings = state.value!.copyWith(locale: locale?.toAppLocale());

    await ref.read(settingsRepositoryProvider).update(settings);
    state = AsyncData(settings);
  }

  Future<void> setTheme(AppTheme theme) async {
    final settings = state.value!.copyWith(theme: theme);

    await ref.read(settingsRepositoryProvider).update(settings);
    state = AsyncData(settings);
  }
}
