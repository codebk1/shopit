import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        error: error!,
      );
    }
  }
}
