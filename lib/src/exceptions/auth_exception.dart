import 'package:shopit/src/l10n/l10n.dart';

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
      InvalidEmailException() => l10n.authExceptionEmailAlreadyInUse,
      EmailAlreadyInUseException() => l10n.authExceptionEmailAlreadyInUse,
      WrongPasswordException() => l10n.authExceptionEmailAlreadyInUse,
      WeakPasswordException() => l10n.authExceptionEmailAlreadyInUse,
      UserNotFoundException() => l10n.authExceptionEmailAlreadyInUse,
      UserDisabledException() => l10n.authExceptionEmailAlreadyInUse,
      RequiresRecentLoginException() => l10n.authExceptionEmailAlreadyInUse,
      OperationNotAllowedException() => l10n.authExceptionEmailAlreadyInUse,
      AuthUnknownException() => l10n.authExceptionEmailAlreadyInUse,
    };
  }
}
