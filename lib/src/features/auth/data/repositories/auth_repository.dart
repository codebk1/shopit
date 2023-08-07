import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
//import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/features/auth/auth.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._remoteDataSource);

  final IAuthRemoteDataSource _remoteDataSource;

  User? get currentUser => _remoteDataSource.currentUser;
  Stream<User?> authStateChanges() => _remoteDataSource.authStateChanges();

  Future<void> signIn(
    String email,
    String password,
  ) {
    return _remoteDataSource.signInWithEmailAndPassword(email, password);
  }

  Future<User> signUp(
    String email,
    String password,
  ) {
    return _remoteDataSource.signUpWithEmailAndPassword(
      email,
      password,
    );
  }

  Future<void> updateEmail(String email) {
    return _remoteDataSource.updateEmail(email);
  }

  Future<void> updatePassword(String password) {
    return _remoteDataSource.updatePassword(password);
  }

  Future<void> signOut() {
    return _remoteDataSource.signOut();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final remoteDataSource = AuthFirestoreDataSource(
    firebase_auth.FirebaseAuth.instance,
  );

  // final remoteDataSource =
  //     AuthSupabaseDataSource(supabase.Supabase.instance.client);

  return AuthRepository(remoteDataSource);
}
