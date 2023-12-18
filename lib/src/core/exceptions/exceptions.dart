import 'package:flutter/widgets.dart';

import 'package:shopit/src/core/core.dart';

export 'app_exception.dart';
export 'auth_exception.dart';
export 'storage_exception.dart';

String errorMessage(Object? error, BuildContext context) {
  return switch (error) {
    AppException() => error.l10n(context.l10n),
    AuthException() => error.l10n(context.l10n),
    StorageException() => error.l10n(context.l10n),
    _ => error.toString()
  };
}
