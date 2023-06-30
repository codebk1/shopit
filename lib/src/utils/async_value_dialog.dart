import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/widgets/dialogs.dart';

extension AsyncValueDialog on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      showAlertDialog(
        context: context,
        title: 'Error',
        content: _errorMessage(error),
      );
    }
  }

  String _errorMessage(Object? error) {
    return error is FirebaseAuthException ? error.message! : error.toString();
  }
}
