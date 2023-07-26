import 'package:firebase_auth/firebase_auth.dart';

abstract interface class IAuthRemoteDataSource {
  User? get currentUser;
  Stream<User?> authStateChanges();

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> updateEmail(String email);
  Future<void> updatePassword(String password);
  Future<void> signOut();
}
