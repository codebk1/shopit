import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class AuthFirebaseDataSource implements IAuthRemoteDataSource {
  const AuthFirebaseDataSource(this._auth);

  final firebase_auth.FirebaseAuth _auth;

  @override
  User? get currentUser => _auth.currentUser?.toUser;

  @override
  Stream<User?> authStateChanges() =>
      _auth.authStateChanges().asyncMap((user) => user?.toUser);

  @override
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
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
      final credentials = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credentials.user!.toUser;
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }

  @override
  Future<void> updateEmail(String email) async {
    try {
      await _auth.currentUser!.verifyBeforeUpdateEmail(email);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> updatePassword(String password) async {
    try {
      await _auth.currentUser!.updatePassword(password);
    } on firebase_auth.FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    } catch (_) {
      throw AuthUnknownException();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email!);
  }
}
