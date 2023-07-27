import 'package:isar/isar.dart';

import 'package:shopit/src/features/settings/domain/datasources/settings_local_datasource.dart';
import 'package:shopit/src/features/settings/domain/schemas/settings.dart';

class SettingsIsarDataSource implements ISettingsLocalDataSource {
  SettingsIsarDataSource(this._isar);

  final Isar _isar;

  @override
  Future<Settings?> get() async {
    return _isar.settings.get(1);
  }

  @override
  Future<void> update(Settings settings) async {
    return _isar.writeTxn(() => _isar.settings.put(settings));
  }

  @override
  Future<void> clear() async {
    return _isar.writeTxn(() => _isar.settings.clear());
  }
}
