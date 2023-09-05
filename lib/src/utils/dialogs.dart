import 'package:flutter/material.dart';
import 'package:shopit/src/exceptions/exceptions.dart';

import 'package:shopit/src/l10n/l10n.dart';

Future<T?> showErrorDialog<T>({
  required BuildContext context,
  String? title,
  required Object error,
}) async {
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      title: Text(title ?? context.l10n.alertErrorHeader),
      content: Text(_errorMessage(error, context)),
      actions: [
        TextButton(
          child: Text(context.l10n.alertErrorDismissButton),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}

String _errorMessage(Object? error, BuildContext context) {
  return switch (error) {
    AppException() => error.l10n(context.l10n),
    AuthException() => error.l10n(context.l10n),
    StorageException() => error.l10n(context.l10n),
    _ => error.toString()
  };
}
