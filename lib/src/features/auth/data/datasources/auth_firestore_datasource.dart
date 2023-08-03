import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopit/src/exceptions/auth_exception.dart';

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
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> updateEmail(String email) async {
    try {
      return await _auth.currentUser!.updateEmail(email);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> updatePassword(String password) async {
    try {
      return await _auth.currentUser!.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      throw AuthException.fromCode(e.code);
    } catch (_) {
      throw AuthUnknownException();
    }
  }

  @override
  Future<void> signOut() {
    return _auth.signOut();
  }
}
