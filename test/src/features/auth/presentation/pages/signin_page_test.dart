import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

import '../../../../../helpers/helpers.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockSettingsRepository extends Mock implements SettingsRepository {}

class MockWishlistRepository extends Mock implements WishlistRepository {}

class MockCheckoutRepository extends Mock implements CheckoutRepository {}

void main() {
  const email = 'test1@test.com';
  const password = 'test123';

  group('signIn page', () {
    late AuthRepository authRepository;
    late SettingsRepository settingsRepository;
    late WishlistRepository wishlistRepository;
    late CheckoutRepository checkoutRepository;
    late ProviderContainer container;

    setUp(() async {
      authRepository = MockAuthRepository();
      settingsRepository = MockSettingsRepository();
      wishlistRepository = MockWishlistRepository();
      checkoutRepository = MockCheckoutRepository();

      container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(authRepository),
          settingsRepositoryProvider.overrideWithValue(settingsRepository),
          wishlistRepositoryProvider.overrideWithValue(wishlistRepository),
          checkoutRepositoryProvider.overrideWithValue(checkoutRepository),
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
    });

    testWidgets('can navigate to SignUpPage', (tester) async {
      final goRouter = MockGoRouter();

      when(() => goRouter.replaceNamed(any())).thenAnswer(
        (_) => Future<void>.value(),
      );

      await tester.pumpApp(const SignInPage(), container, goRouter);

      final goToSignUpPageButton = find.byKey(
        const Key('goToSignUpPageButton'),
      );

      await tester.tap(goToSignUpPageButton);
      await tester.pumpAndSettle();

      verify(() => goRouter.replaceNamed(Routes.signup.name)).called(1);
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

      when(() => checkoutRepository.clear())
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

      when(() => checkoutRepository.clear())
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
