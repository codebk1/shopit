import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopit/src/features/settings/data/datasources/settings_isar_datasource.dart';
import 'package:shopit/src/features/settings/domain/datasources/settings_local_datasource.dart';
import 'package:shopit/src/features/settings/domain/schemas/settings.dart';
import 'package:shopit/src/utils/isar.dart';

part 'settings_repository.g.dart';

class SettingsRepository {
  SettingsRepository(this._localDataSource);

  final ISettingsLocalDataSource _localDataSource;

  Future<Settings> get() async {
    return await _localDataSource.get() ?? const Settings();
  }

  Future<void> update(Settings settings) async {
    return _localDataSource.update(settings);
  }

  Future<void> clear() async {
    return _localDataSource.clear();
  }
}

@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  final localDataSource = SettingsIsarDataSource(isar);

  return SettingsRepository(localDataSource);
}
