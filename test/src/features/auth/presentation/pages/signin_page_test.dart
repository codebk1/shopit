import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/cart/cart.dart';
import 'package:shopit/src/features/settings/settings.dart';
import 'package:shopit/src/features/wishlist/wishlist.dart';

import '../../../../../helpers/helpers.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockSettingsRepository extends Mock implements SettingsRepository {}

class MockWishlistRepository extends Mock implements WishlistRepository {}

class MockCartLocalRepository extends Mock implements CartLocalRepository {}

void main() {
  const email = 'test1@test.com';
  const password = 'test123';

  group('signIn page', () {
    late AuthRepository authRepository;
    late SettingsRepository settingsRepository;
    late WishlistRepository wishlistRepository;
    late CartLocalRepository cartLocalRepository;
    late ProviderContainer container;

    setUp(() async {
      authRepository = MockAuthRepository();
      settingsRepository = MockSettingsRepository();
      wishlistRepository = MockWishlistRepository();
      cartLocalRepository = MockCartLocalRepository();

      container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(authRepository),
          settingsRepositoryProvider.overrideWithValue(settingsRepository),
          wishlistRepositoryProvider.overrideWithValue(wishlistRepository),
          cartLocalRepositoryProvider.overrideWithValue(cartLocalRepository),
        ],
      );

      when(() => settingsRepository.get()).thenAnswer(
        (_) async => const Settings(
          theme: AppTheme(
            brightness: Brightness.light,
            seed: ThemeSeed.blue,
          ),
        ),
      );

      await container.read(settingsControllerProvider.future);
    });

    testWidgets('renders SignInPage', (tester) async {
      await tester.pumpApp(const SignInPage(), container);

      expect(find.byType(SignInPage), findsOneWidget);
      expect(find.text(tester.l10n.signInAppBarTitle), findsAtLeastNWidgets(1));
    });

    testWidgets('not sign in when form is empty', (tester) async {
      await tester.pumpApp(const SignInPage(), container);

      final signInButton = find.byType(ElevatedButton);
      expect(signInButton, findsOneWidget);

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.byType(Loader), findsNothing);
      verifyNever(() => authRepository.signIn(any(), any()));
    });

    testWidgets('sign in with success', (tester) async {
      when(() => authRepository.signIn(email, password))
          .thenAnswer((_) => Future.delayed(const Duration(seconds: 1)));

      when(() => wishlistRepository.clear())
          .thenAnswer((_) => Future<void>.value());

      when(() => cartLocalRepository.clear())
          .thenAnswer((_) => Future<void>.value());

      await tester.pumpApp(const SignInPage(), container);

      final emailField = find.byType(EmailField);
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = find.byType(PasswordField);
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      final signInButton = find.byType(ElevatedButton);
      expect(signInButton, findsOneWidget);

      await tester.tap(signInButton);
      await tester.pump();

      expect(find.byType(Loader), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(Loader), findsNothing);
    });

    testWidgets('sign in with failure', (tester) async {
      when(() => authRepository.signIn(email, password)).thenThrow(Exception);

      when(() => wishlistRepository.clear())
          .thenAnswer((_) => Future<void>.value());

      when(() => cartLocalRepository.clear())
          .thenAnswer((_) => Future<void>.value());

      await tester.pumpApp(const SignInPage(), container);

      final emailField = find.byType(EmailField);
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = find.byType(PasswordField);
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      final signInButton = find.byType(ElevatedButton);
      expect(signInButton, findsOneWidget);

      await tester.tap(signInButton);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
