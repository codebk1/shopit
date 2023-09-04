import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';

Future<T?> showErrorDialog<T>({
  required BuildContext context,
  String? title,
  String? content,
}) async {
  return showAdaptiveDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => AlertDialog(
      title: Text(title ?? context.l10n.alertErrorHeader),
      content: Text(content ?? ''),
      actions: [
        TextButton(
          child: Text(context.l10n.alertErrorDismissButton),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    ),
  );
}
