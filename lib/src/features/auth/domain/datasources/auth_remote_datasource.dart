import 'package:shopit/src/features/features.dart';

abstract interface class IAuthRemoteDataSource {
  User? get currentUser;
  Stream<User?> authStateChanges();

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  );

  Future<User> signUpWithEmailAndPassword(
    String email,
    String password,
  );

  Future<void> signOut();
  Future<void> updateEmail(String email);
  Future<void> updatePassword(String password);
}
