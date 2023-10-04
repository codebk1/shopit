import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/settings/settings.dart';
import 'package:shopit/src/features/wishlist/wishlist.dart';
import 'package:shopit/src/features/cart/cart.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockWishlistRepository extends Mock implements WishlistRepository {}

class MockCartRepository extends Mock implements CartRepository {}

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockSettingsRepository extends Mock implements SettingsRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  const email = 'test1@test.com';
  const password = 'test123';
  const firstName = 'John';
  const lastName = 'Doe';
  const user = User(id: '1', email: email);
  const profile = Profile(id: '1', firstName: firstName, lastName: lastName);

  group('AuthController', () {
    late AuthRepository authRepository;
    late WishlistRepository wishlistRepository;
    late CartRepository cartLocalRepository;
    late ProfileRepository profileRepository;
    late SettingsRepository settingsRepository;
    late ProviderContainer container;

    setUpAll(() {
      registerFallbackValue(const AsyncLoading<void>());
    });

    setUp(() {
      authRepository = MockAuthRepository();
      wishlistRepository = MockWishlistRepository();
      cartLocalRepository = MockCartRepository();
      profileRepository = MockProfileRepository();
      settingsRepository = MockSettingsRepository();

      container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(authRepository),
          wishlistRepositoryProvider.overrideWithValue(wishlistRepository),
          cartRepositoryProvider.overrideWithValue(cartLocalRepository),
          profileRepositoryProvider.overrideWithValue(profileRepository),
          settingsRepositoryProvider.overrideWithValue(settingsRepository),
        ],
      );

      addTearDown(container.dispose);
    });

    group('build', () {
      test('correct initial state', () {
        final listener = Listener<AsyncValue<void>>();

        container.listen(
          authControllerProvider,
          listener,
          fireImmediately: true,
        );

        verify(() => listener(null, const AsyncData<void>(null)));
        verifyNoMoreInteractions(listener);
      });
    });

    group('signIn', () {
      test('success', () async {
        when(() => authRepository.signIn(email, password))
            .thenAnswer((_) => Future<void>.value());

        when(() => wishlistRepository.clear())
            .thenAnswer((_) => Future<void>.value());

        when(() => cartLocalRepository.clear())
            .thenAnswer((_) => Future<void>.value());

        final listener = Listener<AsyncValue<void>>();

        container.listen(
          authControllerProvider,
          listener,
          fireImmediately: true,
        );

        const data = AsyncData<void>(null);
        verify(() => listener(null, data));

        await container
            .read(authControllerProvider.notifier)
            .signIn(email: email, password: password);

        verifyInOrder([
          () => listener(data, any(that: isA<AsyncLoading>())),
          () => listener(any(that: isA<AsyncLoading>()), data),
        ]);

        verifyNoMoreInteractions(listener);
        verify(() => authRepository.signIn(email, password)).called(1);
        verify(wishlistRepository.clear).called(1);
        verify(cartLocalRepository.clear).called(1);
      });

      test('error', () async {
        when(() => authRepository.signIn(email, password)).thenThrow(Exception);

        final listener = Listener<AsyncValue<void>>();

        container.listen(
          authControllerProvider,
          listener,
          fireImmediately: true,
        );

        const data = AsyncData<void>(null);
        verify(() => listener(null, data));

        await container
            .read(authControllerProvider.notifier)
            .signIn(email: email, password: password);

        verifyInOrder([
          () => listener(
                data,
                any(that: isA<AsyncLoading>()),
              ),
          () => listener(
                any(that: isA<AsyncLoading>()),
                any(that: isA<AsyncError>()),
              ),
        ]);

        verifyNoMoreInteractions(listener);
        verify(() => authRepository.signIn(email, password)).called(1);
        verifyNever(() => wishlistRepository.clear());
        verifyNever(() => cartLocalRepository.clear());
      });
    });

    group('signUp', () {
      test('success', () async {
        when(() => authRepository.signUp(email, password))
            .thenAnswer((_) async => user);

        when(() => profileRepository.update(profile))
            .thenAnswer((_) async => profile);

        final listener = Listener<AsyncValue<void>>();

        container.listen(
          authControllerProvider,
          listener,
          fireImmediately: true,
        );

        const data = AsyncData<void>(null);
        verify(() => listener(null, data));

        await container.read(authControllerProvider.notifier).signUp(
              email: email,
              password: password,
              firstName: firstName,
              lastName: lastName,
            );

        verifyInOrder([
          () => listener(data, any(that: isA<AsyncLoading>())),
          () => listener(any(that: isA<AsyncLoading>()), data),
        ]);

        verifyNoMoreInteractions(listener);
        verify(() => authRepository.signUp(email, password)).called(1);
        verify(() => profileRepository.update(profile)).called(1);
      });

      test('error', () async {
        when(() => authRepository.signUp(email, password)).thenThrow(Exception);

        final listener = Listener<AsyncValue<void>>();

        container.listen(
          authControllerProvider,
          listener,
          fireImmediately: true,
        );

        const data = AsyncData<void>(null);
        verify(() => listener(null, data));

        await container.read(authControllerProvider.notifier).signUp(
              email: email,
              password: password,
              firstName: firstName,
              lastName: lastName,
            );

        verifyInOrder([
          () => listener(
                data,
                any(that: isA<AsyncLoading>()),
              ),
          () => listener(
                any(that: isA<AsyncLoading>()),
                any(that: isA<AsyncError>()),
              ),
        ]);

        verifyNoMoreInteractions(listener);
        verify(() => authRepository.signUp(email, password)).called(1);
        verifyNever(() => profileRepository.update(profile));
      });
    });

    group('signOut', () {
      test('success', () async {
        when(() => authRepository.signOut())
            .thenAnswer((_) => Future<void>.value());

        when(() => settingsRepository.clear())
            .thenAnswer((_) => Future<void>.value());

        final listener = Listener<AsyncValue<void>>();

        container.listen(
          authControllerProvider,
          listener,
          fireImmediately: true,
        );

        const data = AsyncData<void>(null);
        verify(() => listener(null, data));

        await container.read(authControllerProvider.notifier).signOut();

        verifyInOrder([
          () => listener(data, any(that: isA<AsyncLoading>())),
          () => listener(any(that: isA<AsyncLoading>()), data),
        ]);

        verifyNoMoreInteractions(listener);
        verify(() => authRepository.signOut()).called(1);
        verify(() => settingsRepository.clear()).called(1);
      });

      test('error', () async {
        when(() => authRepository.signOut()).thenThrow(Exception);

        final listener = Listener<AsyncValue<void>>();

        container.listen(
          authControllerProvider,
          listener,
          fireImmediately: true,
        );

        const data = AsyncData<void>(null);
        verify(() => listener(null, data));

        await container.read(authControllerProvider.notifier).signOut();

        verifyInOrder([
          () => listener(
                data,
                any(that: isA<AsyncLoading>()),
              ),
          () => listener(
                any(that: isA<AsyncLoading>()),
                any(that: isA<AsyncError>()),
              ),
        ]);

        verifyNoMoreInteractions(listener);
        verify(() => authRepository.signOut()).called(1);
        verifyNever(() => settingsRepository.clear());
      });
    });
  });
}
