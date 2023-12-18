import 'package:shopit/src/features/features.dart';

abstract interface class ISettingsLocalDataSource {
  Future<Settings?> get();
  Future<void> update(Settings settings);
  Future<void> clear();
}
