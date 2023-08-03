import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/exceptions/app_exception.dart';

part 'auth_exception.freezed.dart';

@freezed
sealed class AuthException with _$AuthException implements AppException {
  factory AuthException.fromCode(Object code) {
    return switch (code) {
      'invalid-email' => const AuthException.invalidEmail(),
      'email-already-in-use' => const AuthException.emailAlreadyInUse(),
      'wrong-password' => const AuthException.wrongPassword(),
      'weak-password' => const AuthException.weakPassword(),
      'user-not-found' => const AuthException.userNotFound(),
      'user-disabled' => const AuthException.userDisabled(),
      'requires-recent-login' => const AuthException.requiresRecentLogin(),
      'operation-not-allowed' => const AuthException.operationNotAllowed(),
      _ => const AuthException.unknown(),
    };
  }

  const factory AuthException.invalidEmail() = InvalidEmail;
  const factory AuthException.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthException.wrongPassword() = WrongPassword;
  const factory AuthException.weakPassword() = WeakPassword;
  const factory AuthException.userNotFound() = UserNotFound;
  const factory AuthException.userDisabled() = UserDisabled;
  const factory AuthException.requiresRecentLogin() = RequiresRecentLogin;
  const factory AuthException.operationNotAllowed() = OperationNotAllowed;
  const factory AuthException.unknown() = Unknown;
}

extension AuthExceptionExtension on AuthException {
  String translate(AppLocalizations l10n) {
    return switch (this) {
      InvalidEmail() => l10n.authExceptionInvalidEmail,
      EmailAlreadyInUse() => l10n.authExceptionEmailAlreadyInUse,
      WrongPassword() => l10n.authExceptionWrongPassword,
      WeakPassword() => l10n.authExceptionWeakPassword,
      UserNotFound() => l10n.authExceptionUserNotFound,
      UserDisabled() => l10n.authExceptionUserDisabled,
      RequiresRecentLogin() => l10n.authExceptionRequiresRecentLogin,
      OperationNotAllowed() => l10n.authExceptionOperationNotAllowed,
      Unknown() => l10n.authExceptionUnknown,
    };
  }
}
