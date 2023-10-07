import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/profile/profile.dart';

class ProfileSupabaseDataSource implements IProfileRemoteDataSource {
  const ProfileSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  supabase.SupabaseQueryBuilder get _profilesRef => _supabase.from('profiles');

  @override
  Future<Profile> get(String id) async {
    try {
      final response = await _profilesRef.select().eq('id', id).single();

      return Profile.fromJson(response).copyWith(
        avatar: await getAvatar(id),
      );
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Stream<Profile?> watch(String id) {
    return _profilesRef
        .select()
        .eq('id', id)
        .single()
        .asStream()
        .asyncMap((event) => Profile.fromJson(event))
        .handleError(throw AppUnknownException());
  }

  @override
  Future<Profile> update(Profile profile, bool updateAvatar) async {
    try {
      await _profilesRef.update(profile.toJson()).eq('id', profile.id);

      if (updateAvatar) {
        return profile.copyWith(
          avatar: await setAvatar(profile.avatar, profile.id),
        );
      }

      return profile;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<String?> getAvatar(String folder) async {
    try {
      final bucket = _supabase.storage.from('users');

      return await bucket.createSignedUrl('$folder/avatar.jpg', 10);
    } on supabase.StorageException catch (e) {
      if (e.statusCode == '404') return null;
      throw StorageUnknownException();
    } catch (_) {
      throw StorageUnknownException();
    }
  }

  @override
  Future<String?> setAvatar(String? path, String folder) async {
    try {
      final bucket = _supabase.storage.from('users');

      if (path == null) {
        await bucket.remove(['$folder/avatar.jpg']);
        return null;
      }

      await bucket.upload(
        '$folder/avatar.jpg',
        File(path),
        fileOptions: const supabase.FileOptions(upsert: true),
      );

      return await bucket.createSignedUrl('$folder/avatar.jpg', 10);
    } catch (_) {
      throw StorageUnknownException();
    }
  }
}
