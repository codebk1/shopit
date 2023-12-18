import 'package:shopit/src/core/core.dart';

sealed class AuthException implements Exception {
  const AuthException();

  factory AuthException.fromCode(Object code) {
    return switch (code) {
      'invalid-email' => InvalidEmailException(),
      'email-already-in-use' => EmailAlreadyInUseException(),
      'wrong-password' => WrongPasswordException(),
      'weak-password' => WeakPasswordException(),
      'user-not-found' => UserNotFoundException(),
      'user-disabled' => UserDisabledException(),
      'requires-recent-login' => RequiresRecentLoginException(),
      'operation-not-allowed' => OperationNotAllowedException(),
      _ => AuthUnknownException(),
    };
  }
}

class InvalidCredentialsException extends AuthException {}

class InvalidEmailException extends AuthException {}

class EmailAlreadyInUseException extends AuthException {}

class WrongPasswordException extends AuthException {}

class WeakPasswordException extends AuthException {}

class UserNotFoundException extends AuthException {}

class UserDisabledException extends AuthException {}

class RequiresRecentLoginException extends AuthException {}

class OperationNotAllowedException extends AuthException {}

class AuthUnknownException extends AuthException {}

extension AuthExceptionExtension on AuthException {
  String l10n(AppLocalizations l10n) {
    return switch (this) {
      InvalidCredentialsException() => l10n.authExceptionInvalidCredentials,
      InvalidEmailException() => l10n.authExceptionInvalidEmail,
      EmailAlreadyInUseException() => l10n.authExceptionEmailAlreadyInUse,
      WrongPasswordException() => l10n.authExceptionWrongPassword,
      WeakPasswordException() => l10n.authExceptionWeakPassword,
      UserNotFoundException() => l10n.authExceptionUserNotFound,
      UserDisabledException() => l10n.authExceptionUserDisabled,
      RequiresRecentLoginException() => l10n.authExceptionRequiresRecentLogin,
      OperationNotAllowedException() => l10n.authExceptionOperationNotAllowed,
      AuthUnknownException() => l10n.authExceptionUnknown,
    };
  }
}
