import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

part 'settings_repository.g.dart';

class SettingsRepository {
  SettingsRepository(this._localDataSource);

  final ISettingsLocalDataSource _localDataSource;

  Future<Settings> get() async {
    return await _localDataSource.get() ?? const Settings();
  }

  Future<void> update(Settings settings) {
    return _localDataSource.update(settings);
  }

  Future<void> clear() {
    return _localDataSource.clear();
  }
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  final db = ref.watch(appDatabaseProvider);
  final localDataSource = SettingsLocalDataSource(db);

  return SettingsRepository(localDataSource);
}
