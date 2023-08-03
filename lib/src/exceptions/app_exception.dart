import 'package:flutter/widgets.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/exceptions/auth_exception.dart';

abstract class AppException implements Exception {}

extension AppExceptionExtension on AppException {
  String l10n(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      AuthException e => e.translate(l10n),
      _ => l10n.appExceptionUnknown,
    };
  }
}
