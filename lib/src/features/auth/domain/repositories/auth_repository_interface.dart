import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositoryInterface {
  Stream<User?> authStateChanges();

  User? get currentUser;

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> signOut();

  Future<void> updateEmail(String newEmail);

  Future<void> updatePassword(String newPassword);
}
