import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/features/profile/profile.dart';

part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository(this._remoteDataSource);

  final IProfileRemoteDataSource _remoteDataSource;

  Future<Profile> get(String userId) {
    return _remoteDataSource.get(userId);
  }

  Stream<Profile?> watch(String userId) {
    return _remoteDataSource.watch(userId);
  }

  Future<Profile> update(Profile profile, {bool updateAvatar = false}) {
    return _remoteDataSource.update(profile, updateAvatar);
  }
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final remoteDataSource = ProfileFirestoreDataSource(
    FirebaseFirestore.instance,
    FirebaseStorage.instance,
  );

  // final remoteDataSource = ProfileSupabaseDataSource(
  //   supabase.Supabase.instance.client,
  // );

  return ProfileRepository(remoteDataSource);
}
