import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/domain/datasources/auth_remote_datasource.dart';
import 'package:shopit/src/features/auth/data/datasources/auth_firestore_datasource.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._remoteDataSource);

  final IAuthRemoteDataSource _remoteDataSource;

  User? get currentUser => _remoteDataSource.currentUser;
  Stream<User?> authStateChanges() => _remoteDataSource.authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _remoteDataSource.signInWithEmailAndPassword(email, password);
  }

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _remoteDataSource.createUserWithEmailAndPassword(email, password);
  }

  Future<void> updateEmail(String email) async {
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
  final remoteDataSource = AuthFirestoreDataSource(FirebaseAuth.instance);

  return AuthRepository(remoteDataSource);
}
