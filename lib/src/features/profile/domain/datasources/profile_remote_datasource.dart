import 'package:shopit/src/features/profile/profile.dart';

abstract interface class IProfileRemoteDataSource {
  Future<Profile> get(String id);
  Stream<Profile?> watch(String id);
  Future<void> update(Profile profile);
}