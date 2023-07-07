import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._auth);

  final FirebaseAuth _auth;

  Stream<User?> authStateChanges() => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Future<void> updateEmail(String newEmail) async {
    return _auth.currentUser!.updateEmail(newEmail);
  }

  Future<void> updatePassword(String newPassword) {
    return _auth.currentUser!.updatePassword(newPassword);
  }
}
