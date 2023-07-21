import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueMessenger on AsyncValue {
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
          title: const Text('Error'),
          content: Text(_errorMessage(error)),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  String _errorMessage(Object? error) {
    return error is FirebaseException ? error.message! : error.toString();
  }
}
