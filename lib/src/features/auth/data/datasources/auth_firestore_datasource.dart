import 'package:firebase_auth/firebase_auth.dart';

import 'package:shopit/src/features/auth/domain/datasources/auth_remote_datasource.dart';

class AuthFirestoreDataSource implements IAuthRemoteDataSource {
  const AuthFirestoreDataSource(this._auth);

  final FirebaseAuth _auth;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> updateEmail(String email) async {
    return _auth.currentUser!.updateEmail(email);
  }

  @override
  Future<void> updatePassword(String password) {
    return _auth.currentUser!.updatePassword(password);
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
}
