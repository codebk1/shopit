import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';

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
      content: Text(errorMessage(error, context)),
      actions: [
        TextButton(
          child: Text(context.l10n.alertErrorDismissButton),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
