import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class AuthSupabaseDataSource implements IAuthRemoteDataSource {
  const AuthSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  @override
  User? get currentUser => _supabase.auth.currentUser?.toUser;

  @override
  Stream<User?> authStateChanges() => _supabase.auth.onAuthStateChange.asyncMap(
        (event) => event.session?.user.toUser,
      );

  @override
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on supabase.AuthException catch (_) {
      throw InvalidCredentialsException();
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<User> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      return response.user!.toUser;
    } on supabase.AuthException catch (_) {
      throw InvalidCredentialsException();
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> updateEmail(String email) async {
    try {
      await _supabase.auth.updateUser(supabase.UserAttributes(email: email));
    } on supabase.AuthException catch (_) {
      throw InvalidCredentialsException();
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> updatePassword(String password) async {
    try {
      await _supabase.auth.updateUser(
        supabase.UserAttributes(password: password),
      );
    } on supabase.AuthException catch (_) {
      throw InvalidCredentialsException();
    } catch (_) {
      throw AuthUnknownException();
    }
  }
}

extension on supabase.User {
  User get toUser {
    return User(id: id, email: email!);
  }
}
