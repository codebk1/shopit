import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class MockFirebaseAuth extends Mock implements firebase_auth.FirebaseAuth {}

class MockUserCredential extends Mock implements firebase_auth.UserCredential {
  MockUserCredential() {
    when(() => user).thenReturn(
      MockFirebaseUser(uid: '1', email: 'test1@test.com'),
    );
  }
}

class MockFirebaseUser extends Mock implements firebase_auth.User {
  MockFirebaseUser({
    required this.uid,
    required this.email,
  });

  @override
  final String uid;

  @override
  final String email;
}

void main() {
  const email = 'test1@test.com';
  const password = 'test123';

  const user1 = User(id: '1', email: 'test1@test.com');
  const user2 = User(id: '2', email: 'test2@test.com');

  final firebaseUser1 = MockFirebaseUser(uid: '1', email: 'test1@test.com');
  final firebaseUser2 = MockFirebaseUser(uid: '2', email: 'test2@test.com');

  group('AuthFirebaseDataSource', () {
    late firebase_auth.FirebaseAuth firebaseAuth;
    late AuthFirebaseDataSource sut;

    setUp(() {
      firebaseAuth = MockFirebaseAuth();
      sut = AuthFirebaseDataSource(firebaseAuth);
    });

    group('currentUser', () {
      test('should retrieve current user when available', () async {
        expect(sut.currentUser, null);

        when(() => firebaseAuth.currentUser).thenAnswer(
          (_) => firebaseUser1,
        );

        expect(sut.currentUser, isA<User>());

        verify(() => firebaseAuth.currentUser).called(2);
      });
    });

    group('authStateChanges', () {
      test('should emit user when available', () {
        final controller = StreamController<MockFirebaseUser?>();

        when(() => firebaseAuth.authStateChanges())
            .thenAnswer((_) => controller.stream);

        addTearDown(controller.close);

        controller
          ..add(firebaseUser1)
          ..add(null)
          ..add(firebaseUser2);

        expect(sut.authStateChanges(), emitsInOrder([user1, null, user2]));
      });
    });

    group('signInWithEmailAndPassword', () {
      test(
          'succeeds when FirebaseAuth signInWithEmailAndPassword method succeeds',
          () {
        when(() => firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenAnswer((_) async => MockUserCredential());

        expect(sut.signInWithEmailAndPassword(email, password), completes);
      });

      test('throws correct Exception when FirebaseAuthException is threw', () {
        when(() => firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(
          firebase_auth.FirebaseAuthException(code: 'invalid-email'),
        );

        expect(
          sut.signInWithEmailAndPassword(email, password),
          throwsA(isA<InvalidEmailException>()),
        );
      });

      test('throws correct Exception when FirebaseAuthException is not threw',
          () {
        when(() => firebaseAuth.signInWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(Exception);

        expect(
          sut.signInWithEmailAndPassword(email, password),
          throwsA(isA<AuthUnknownException>()),
        );
      });
    });

    group('signUpWithEmailAndPassword', () {
      test(
          'return User when FirebaseAuth createUserWithEmailAndPassword method returns UserCredential object',
          () async {
        when(() => firebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            )).thenAnswer((_) async => MockUserCredential());

        expect(
          await sut.signUpWithEmailAndPassword(email, password),
          user1,
        );
      });

      test('throws correct Exception when FirebaseAuthException is threw', () {
        when(() => firebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(
          firebase_auth.FirebaseAuthException(code: 'invalid-email'),
        );

        expect(
          sut.signUpWithEmailAndPassword(email, password),
          throwsA(isA<InvalidEmailException>()),
        );
      });

      test('throws correct Exception when FirebaseAuthException is not threw',
          () {
        when(() => firebaseAuth.createUserWithEmailAndPassword(
              email: email,
              password: password,
            )).thenThrow(Exception);

        expect(
          sut.signUpWithEmailAndPassword(email, password),
          throwsA(isA<AuthUnknownException>()),
        );
      });
    });

    group('signOut', () {
      test('succeeds when FirebaseAuth signOut method succeeds', () {
        when(firebaseAuth.signOut).thenAnswer((_) async => Future<void>);
        expect(sut.signOut(), completes);
      });
    });

    group('updateEmail', () {
      test('succeeds when FirebaseAuth updateEmail method succeeds', () {
        when(() => firebaseAuth.currentUser).thenAnswer(
          (_) => firebaseUser1,
        );

        when(() => firebaseUser1.verifyBeforeUpdateEmail(email))
            .thenAnswer((_) async => Future<void>);

        expect(sut.updateEmail(email), completes);
      });

      test('throws correct Exception when FirebaseAuthException is threw', () {
        when(() => firebaseAuth.currentUser!.verifyBeforeUpdateEmail(email))
            .thenThrow(
          firebase_auth.FirebaseAuthException(code: 'invalid-email'),
        );

        expect(
          sut.updateEmail(email),
          throwsA(isA<InvalidEmailException>()),
        );
      });

      test('throws correct Exception when FirebaseAuthException is not threw',
          () {
        when(() => firebaseAuth.currentUser!.verifyBeforeUpdateEmail(email))
            .thenThrow(Exception);

        expect(
          sut.updateEmail(email),
          throwsA(isA<AuthUnknownException>()),
        );
      });
    });

    group('updatePassword', () {
      test('succeeds when FirebaseAuth updatePassword method succeeds', () {
        when(() => firebaseAuth.currentUser).thenAnswer(
          (_) => firebaseUser1,
        );

        when(() => firebaseUser1.updatePassword(password))
            .thenAnswer((_) async => Future<void>);

        expect(sut.updatePassword(password), completes);
      });

      test('throws correct Exception when FirebaseAuthException is threw', () {
        when(() => firebaseAuth.currentUser!.verifyBeforeUpdateEmail(email))
            .thenThrow(
          firebase_auth.FirebaseAuthException(code: 'weak-password'),
        );

        expect(
          sut.updatePassword(password),
          throwsA(isA<WeakPasswordException>()),
        );
      });

      test('throws correct Exception when FirebaseAuthException is not threw',
          () {
        when(() => firebaseAuth.currentUser!.updatePassword(password))
            .thenThrow(Exception);

        expect(
          sut.updatePassword(password),
          throwsA(isA<AuthUnknownException>()),
        );
      });
    });
  });
}
