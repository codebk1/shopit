import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:shopit/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';

part 'auth_repository.g.dart';

class AuthRepository implements AuthRepositoryInterface {
  AuthRepository(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  Stream<User?> authStateChanges() => _remoteDataSource.authStateChanges();
  @override
  User? get currentUser => _remoteDataSource.currentUser;

  @override
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _remoteDataSource.signInWithEmailAndPassword(
      email,
      password,
    );
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _remoteDataSource.createUserWithEmailAndPassword(
      email,
      password,
    );
  }

  @override
  Future<void> signOut() {
    return _remoteDataSource.signOut();
  }

  @override
  Future<void> updateEmail(String newEmail) async {
    return _remoteDataSource.currentUser!.updateEmail(newEmail);
  }

  @override
  Future<void> updatePassword(String newPassword) {
    return _remoteDataSource.currentUser!.updatePassword(newPassword);
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final remoteDataSource = AuthRemoteDataSource(FirebaseAuth.instance);

  return AuthRepository(remoteDataSource);
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.read(authRepositoryProvider).authStateChanges();
}
