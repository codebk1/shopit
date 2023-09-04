import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/utils/utils.dart';

extension AsyncValueExtension on AsyncValue {
  void showSnackbarOnSuccess(BuildContext context, String text) {
    if (!isLoading && !hasError) {
      showSuccessSnackbar(
        context: context,
        content: text,
      );
    }
  }

  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showErrorDialog(
        context: context,
        content: _errorMessage(error, context),
      );
    }
  }

  String _errorMessage(Object? error, BuildContext context) {
    return switch (error) {
      AppException() => error.l10n(context.l10n),
      AuthException() => error.l10n(context.l10n),
      StorageException() => error.l10n(context.l10n),
      _ => error.toString()
    };
  }
}
