import 'package:shopit/src/core/core.dart';

sealed class AppException implements Exception {}

class AppUnknownException extends AppException {}

extension AppExceptionExtension on AppException {
  String l10n(AppLocalizations l10n) {
    return switch (this) {
      AppUnknownException() => l10n.appExceptionUnknown,
    };
  }
}
