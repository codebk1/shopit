import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/auth/auth.dart';

class MockSupabaseClient extends Mock implements sb.SupabaseClient {}

class MockGoTrueClient extends Mock implements sb.GoTrueClient {
  @override
  Future<sb.UserResponse> updateUser(sb.UserAttributes attributes,
      {String? emailRedirectTo}) async {
    return MockUserResponse.fromJson({});
  }
}

class MockGoTrueSession extends Mock implements sb.Session {
  MockGoTrueSession({
    required this.user,
  });

  @override
  final sb.User user;
}

class MockAuthState extends Mock implements sb.AuthState {
  MockAuthState({
    this.session,
  });

  @override
  final sb.Session? session;
}

class MockAuthResponse extends Mock implements sb.AuthResponse {
  MockAuthResponse() {
    when(() => user).thenReturn(
      MockSupabaseUser(id: '1', email: 'test1@test.com'),
    );
  }
}

class MockUserResponse extends Mock implements sb.UserResponse {
  MockUserResponse.fromJson(Map<String, dynamic> json)
      : user = MockSupabaseUser(id: '1', email: 'test1@test.com');

  @override
  final sb.User user;
}

class MockSupabaseUser extends Mock implements sb.User {
  MockSupabaseUser({
    required this.id,
    required this.email,
  });

  @override
  final String id;

  @override
  final String email;
}

void main() {
  const email = 'test1@test.com';
  const password = 'test123';

  const user1 = User(id: '1', email: 'test1@test.com');
  const user2 = User(id: '2', email: 'test2@test.com');

  final supabaseUser1 = MockSupabaseUser(id: '1', email: 'test1@test.com');
  final supabaseUser2 = MockSupabaseUser(id: '2', email: 'test2@test.com');

  final authState1 = MockAuthState(
    session: MockGoTrueSession(user: supabaseUser1),
  );
  final authState2 = MockAuthState(
    session: MockGoTrueSession(user: supabaseUser2),
  );

  group('AuthSupabaseDataSource', () {
    late sb.SupabaseClient supabase;
    late sb.GoTrueClient goTrueClient;
    late AuthSupabaseDataSource sut;

    setUp(() {
      supabase = MockSupabaseClient();
      goTrueClient = MockGoTrueClient();
      sut = AuthSupabaseDataSource(supabase);

      when(() => supabase.auth).thenReturn(goTrueClient);
      when(() => goTrueClient.currentUser).thenReturn(null);
    });

    group('currentUser', () {
      test('should retrieve current user when available', () async {
        expect(sut.currentUser, null);

        when(() => goTrueClient.currentUser).thenAnswer(
          (_) => supabaseUser1,
        );

        expect(sut.currentUser, user1);

        verify(() => supabase.auth.currentUser).called(2);
      });
    });

    group('authStateChanges', () {
      test('should emit user when available', () {
        final controller = StreamController<sb.AuthState>();

        when(() => goTrueClient.onAuthStateChange)
            .thenAnswer((_) => controller.stream);

        addTearDown(controller.close);

        controller
          ..add(authState1)
          ..add(MockAuthState())
          ..add(authState2);

        expect(sut.authStateChanges(), emitsInOrder([user1, null, user2]));
      });
    });

    group('signInWithEmailAndPassword', () {
      test('succeeds when Supabase signInWithPassword method succeeds', () {
        when(() => goTrueClient.signInWithPassword(
              email: email,
              password: password,
            )).thenAnswer((_) async => MockAuthResponse());

        expect(sut.signInWithEmailAndPassword(email, password), completes);
      });

      test('throws correct Exception when Supabase AuthException is threw', () {
        when(() => goTrueClient.signInWithPassword(
              email: email,
              password: password,
            )).thenThrow(const sb.AuthException(''));

        expect(
          sut.signInWithEmailAndPassword(email, password),
          throwsA(isA<InvalidCredentialsException>()),
        );
      });

      test('throws correct Exception when Supabase AuthException is not threw',
          () {
        when(() => goTrueClient.signInWithPassword(
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
          'return User when Supabase signUp method returns AuthResponse object',
          () async {
        when(() => goTrueClient.signUp(
              email: email,
              password: password,
            )).thenAnswer((_) async => MockAuthResponse());

        expect(
          await sut.signUpWithEmailAndPassword(email, password),
          user1,
        );
      });

      test('throws correct Exception when Supabase AuthException is threw', () {
        when(() => goTrueClient.signUp(
              email: email,
              password: password,
            )).thenThrow(const sb.AuthException(''));

        expect(
          sut.signUpWithEmailAndPassword(email, password),
          throwsA(isA<InvalidCredentialsException>()),
        );
      });

      test('throws correct Exception when Supabase AuthException is not threw',
          () {
        when(() => goTrueClient.signUp(
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
      test('succeeds when Supabase signOut method succeeds', () {
        when(goTrueClient.signOut).thenAnswer((_) async => Future<void>);
        expect(sut.signOut(), completes);
      });

      test('throws correct Exception', () {
        when(goTrueClient.signOut).thenThrow(Exception);

        expect(
          sut.signOut(),
          throwsA(isA<AuthUnknownException>()),
        );
      });
    });

    group('updateEmail', () {
      test('succeeds when Supabase updateUser method succeeds', () {
        expect(sut.updateEmail(email), completes);
      });
    });

    group('updatePassword', () {
      test('succeeds when Supabase updateUser method succeeds', () {
        expect(sut.updatePassword(password), completes);
      });
    });
  });
}
