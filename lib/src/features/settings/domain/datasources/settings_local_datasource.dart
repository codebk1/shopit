import 'package:shopit/src/features/settings/domain/schemas/settings.dart';

abstract interface class ISettingsLocalDataSource {
  Future<Settings?> get();
  Future<void> update(Settings settings);
  Future<void> clear();
}
