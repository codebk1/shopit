import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

import 'package:shopit/src/features/auth/auth.dart';

class FakeUser extends Fake implements User {
  FakeUser({
    required this.id,
    required this.email,
  });

  @override
  final String id;

  @override
  final String email;
}

class MockUser extends Mock implements User {
  MockUser() {
    when(() => id).thenReturn('1');
    when(() => email).thenReturn('test@test.com');
  }
}

class MockIAuthRemoteDataSource extends Mock implements IAuthRemoteDataSource {}

void main() {
  const email = 'test@test.com';
  const password = 'test123';

  group('AuthRepository', () {
    late IAuthRemoteDataSource remoteDataSource;
    late AuthRepository sut;

    setUp(() {
      remoteDataSource = MockIAuthRemoteDataSource();
      sut = AuthRepository(remoteDataSource);
    });

    group('currentUser', () {
      test('should retrieve current user when available', () async {
        expect(sut.currentUser, null);

        when(() => remoteDataSource.currentUser).thenAnswer((_) => MockUser());

        expect(sut.currentUser, isA<MockUser>());

        verify(() => remoteDataSource.currentUser).called(2);
      });
    });

    group('authStateChanges', () {
      test('should react to remoteDataSource auth state changes', () async {
        final controller = StreamController<FakeUser?>();

        when(() => remoteDataSource.authStateChanges())
            .thenAnswer((_) => controller.stream);

        addTearDown(controller.close);

        final user1 = FakeUser(id: '1', email: 'test1@gmail.com');
        final user2 = FakeUser(id: '2', email: 'test2@gmail.com');

        controller
          ..add(user1)
          ..add(user2)
          ..add(null);

        expect(
          sut.authStateChanges(),
          emitsInOrder([user1, user2, null]),
        );
      });
    });

    group('signIn', () {
      setUp(() {
        when(() => remoteDataSource.signInWithEmailAndPassword(email, password))
            .thenAnswer((_) async => Future<void>);
      });

      test('calls remoteDataSource', () async {
        await sut.signIn(email, password);

        verify(
          () => remoteDataSource.signInWithEmailAndPassword(email, password),
        ).called(1);
      });

      test('succeeds when remoteDataSource succeeds', () async {
        expect(sut.signIn(email, password), completes);
      });

      test('throws when remoteDataSource throws', () async {
        when(() => remoteDataSource.signInWithEmailAndPassword(email, password))
            .thenThrow(Exception());

        expect(
          () => sut.signIn(email, password),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('signUp', () {
      setUp(() {
        when(() => remoteDataSource.signUpWithEmailAndPassword(email, password))
            .thenAnswer((_) async => MockUser());
      });

      test('calls remoteDataSource', () async {
        await sut.signUp(email, password);

        verify(
          () => remoteDataSource.signUpWithEmailAndPassword(email, password),
        ).called(1);
      });

      test('succeeds when remoteDataSource succeeds', () async {
        expect(sut.signUp(email, password), completes);
      });

      test('throws when remoteDataSource throws', () async {
        when(() => remoteDataSource.signUpWithEmailAndPassword(email, password))
            .thenThrow(Exception());

        expect(
          () => sut.signUp(email, password),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('signOut', () {
      setUp(() {
        when(remoteDataSource.signOut).thenAnswer((_) async => Future<void>);
      });

      test('calls remoteDataSource', () async {
        await sut.signOut();
        verify(remoteDataSource.signOut).called(1);
      });

      test('succeeds when remoteDataSource succeeds', () async {
        expect(sut.signOut(), completes);
      });
    });

    group('updateEmail', () {
      setUp(() {
        when(() => remoteDataSource.updateEmail(email))
            .thenAnswer((_) async => Future<void>);
      });

      test('calls remoteDataSource', () async {
        await sut.updateEmail(email);

        verify(
          () => remoteDataSource.updateEmail(email),
        ).called(1);
      });

      test('succeeds when remoteDataSource succeeds', () async {
        expect(sut.updateEmail(email), completes);
      });

      test('throws when remoteDataSource throws', () async {
        when(() => remoteDataSource.updateEmail(email)).thenThrow(Exception());

        expect(
          () => sut.updateEmail(email),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('updatePassword', () {
      setUp(() {
        when(() => remoteDataSource.updatePassword(password))
            .thenAnswer((_) async => Future<void>);
      });

      test('calls remoteDataSource', () async {
        await sut.updatePassword(password);

        verify(
          () => remoteDataSource.updatePassword(password),
        ).called(1);
      });

      test('succeeds when remoteDataSource succeeds', () async {
        expect(sut.updatePassword(password), completes);
      });

      test('throws when remoteDataSource throws', () async {
        when(() => remoteDataSource.updatePassword(password))
            .thenThrow(Exception());

        expect(
          () => sut.updatePassword(password),
          throwsA(isA<Exception>()),
        );
      });
    });
  });
}
