import 'package:shopit/src/features/features.dart';

abstract interface class IProfileRemoteDataSource {
  Future<Profile> get(String id);
  Stream<Profile?> watch(String id);
  Future<Profile> update(Profile profile, bool updateAvatar);
  Future<String?> getAvatar(String folder);
  Future<String?> setAvatar(String? avatarPath, String folder);
}
