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

class MockProfileRepository extends Mock implements ProfileRepository {}

void main() {
  const email = 'test1@test.com';
  const password = 'test123';
  const firstName = 'John';
  const lastName = 'Doe';
  const user = User(id: '1', email: email);
  const profile = Profile(id: '1', firstName: firstName, lastName: lastName);

  group('signIn page', () {
    late AuthRepository authRepository;
    late SettingsRepository settingsRepository;
    late ProfileRepository profileRepository;
    late ProviderContainer container;

    setUp(() async {
      authRepository = MockAuthRepository();
      settingsRepository = MockSettingsRepository();
      profileRepository = MockProfileRepository();

      container = ProviderContainer(
        overrides: [
          authRepositoryProvider.overrideWithValue(authRepository),
          settingsRepositoryProvider.overrideWithValue(settingsRepository),
          profileRepositoryProvider.overrideWithValue(profileRepository),
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

    testWidgets('renders SignUpPage', (tester) async {
      await tester.pumpApp(const SignUpPage(), container);

      expect(find.byType(SignUpPage), findsOneWidget);
    });

    testWidgets('can navigate to SignInPage', (tester) async {
      final goRouter = MockGoRouter();

      when(() => goRouter.replaceNamed(any())).thenAnswer(
        (_) => Future<void>.value(),
      );

      await tester.pumpApp(const SignUpPage(), container, goRouter);

      final goToSignInPageButton = find.byKey(
        const Key('goToSignInPageButton'),
      );

      await tester.tap(goToSignInPageButton);
      await tester.pumpAndSettle();

      verify(() => goRouter.replaceNamed(Routes.signin.name)).called(1);
    });

    testWidgets('not sign up when form is empty', (tester) async {
      await tester.pumpApp(const SignUpPage(), container);

      final signUpButton = find.byType(ElevatedButton);
      expect(signUpButton, findsOneWidget);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.byType(Loader), findsNothing);
      verifyNever(() => authRepository.signUp(any(), any()));
    });

    testWidgets('sign up with success', (tester) async {
      when(() => authRepository.signUp(email, password)).thenAnswer(
          (_) => Future.delayed(const Duration(seconds: 1), () => user));

      when(() => profileRepository.update(profile))
          .thenAnswer((_) async => profile);

      await tester.pumpApp(const SignUpPage(), container);

      final firstNameField = find.byType(FirstNameField);
      expect(firstNameField, findsOneWidget);
      await tester.enterText(firstNameField, firstName);

      final lastNameField = find.byType(LastNameField);
      expect(lastNameField, findsOneWidget);
      await tester.enterText(lastNameField, lastName);

      final emailField = find.byType(EmailField);
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = find.byType(PasswordField);
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      final confirmPasswordField = find.byType(ConfirmPasswordField);
      expect(confirmPasswordField, findsOneWidget);
      await tester.enterText(confirmPasswordField, password);

      final signUpButton = find.byType(ElevatedButton);
      expect(signUpButton, findsOneWidget);

      await tester.tap(signUpButton);
      await tester.pump();

      expect(find.byType(Loader), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
      expect(find.byType(Loader), findsNothing);
    });

    testWidgets('sign up with failure', (tester) async {
      when(() => authRepository.signUp(email, password)).thenThrow(Exception);

      await tester.pumpApp(const SignUpPage(), container);

      final firstNameField = find.byType(FirstNameField);
      expect(firstNameField, findsOneWidget);
      await tester.enterText(firstNameField, firstName);

      final lastNameField = find.byType(LastNameField);
      expect(lastNameField, findsOneWidget);
      await tester.enterText(lastNameField, lastName);

      final emailField = find.byType(EmailField);
      expect(emailField, findsOneWidget);
      await tester.enterText(emailField, email);

      final passwordField = find.byType(PasswordField);
      expect(passwordField, findsOneWidget);
      await tester.enterText(passwordField, password);

      final confirmPasswordField = find.byType(ConfirmPasswordField);
      expect(confirmPasswordField, findsOneWidget);
      await tester.enterText(confirmPasswordField, password);

      final signUpButton = find.byType(ElevatedButton);
      expect(signUpButton, findsOneWidget);

      await tester.tap(signUpButton);
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
