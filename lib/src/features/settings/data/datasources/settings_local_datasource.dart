import 'package:drift/drift.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class SettingsLocalDataSource implements ISettingsLocalDataSource {
  SettingsLocalDataSource(this._db);

  final AppDatabase _db;

  @override
  Future<Settings?> get() {
    return _db.localSettings.select().getSingleOrNull();
  }

  @override
  Future<void> update(Settings settings) {
    return _db.localSettings.insertOne(
      settings,
      mode: InsertMode.insertOrReplace,
    );
  }

  @override
  Future<void> clear() {
    return _db.localSettings.deleteAll();
  }
}
