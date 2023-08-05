import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/exceptions/exceptions.dart';

extension AsyncValueExtension on AsyncValue {
  void showSnackbarOnSuccess(BuildContext context, String text) {
    if (!isLoading && !hasError) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar
        ..showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 2),
            content: Text(text),
          ),
        );
    }
  }

  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: Text(context.l10n.alertErrorHeader),
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
  }

  String _errorMessage(Object? error, BuildContext context) {
    return switch (error) {
      AppException() => error.l10n(context.l10n),
      AuthException() => error.l10n(context.l10n),
      _ => error.toString()
    };
  }
}
