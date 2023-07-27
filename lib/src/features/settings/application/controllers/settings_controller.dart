import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopit/src/features/settings/data/repositories/settings_repository.dart';
import 'package:shopit/src/features/settings/domain/schemas/settings.dart';

part 'settings_controller.g.dart';

@Riverpod(keepAlive: true)
class SettingsController extends _$SettingsController {
  @override
  FutureOr<Settings> build() async {
    final settingsRepository = ref.watch(settingsRepositoryProvider);

    return settingsRepository.get();
  }

  Future<void> setLocale(Locale? locale) async {
    final settingsRepository = ref.watch(settingsRepositoryProvider);

    final settings = state.value!.copyWith(locale: locale?.toAppLocale());

    await settingsRepository.update(settings);
    state = AsyncData(settings);
  }
}
