import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/profile/profile.dart';

class ProfileSupabaseDataSource implements IProfileRemoteDataSource {
  const ProfileSupabaseDataSource(this._supabase);

  final SupabaseClient _supabase;

  static const _table = 'profiles';

  @override
  Future<Profile> get(String id) async {
    try {
      final response =
          await _supabase.from(_table).select().eq('id', id).single();

      return Profile.fromJson(response);
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Stream<Profile?> watch(String id) {
    return _supabase
        .from(_table)
        .select()
        .eq('id', id)
        .single()
        .asStream()
        .asyncMap((event) => Profile.fromJson(event))
        .handleError(throw AppUnknownException());
  }

  @override
  Future<void> update(Profile profile) async {
    try {
      await _supabase
          .from(_table)
          .update(profile.toJson())
          .eq('id', profile.id);
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
