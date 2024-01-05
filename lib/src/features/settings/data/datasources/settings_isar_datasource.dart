import 'package:isar/isar.dart';

import 'package:shopit/src/features/features.dart';

class SettingsIsarDataSource implements ISettingsLocalDataSource {
  SettingsIsarDataSource(this._isar);

  final Isar _isar;

  @override
  Future<Settings?> get() {
    return _isar.settings.getAsync('1');
  }

  @override
  Future<void> update(Settings settings) {
    return _isar.writeAsync(
      (isar) => isar.settings.put(settings),
    );
  }

  @override
  Future<void> clear() {
    return _isar.writeAsync(
      (isar) => isar.settings.clear(),
    );
  }
}
