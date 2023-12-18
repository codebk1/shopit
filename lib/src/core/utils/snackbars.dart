import 'package:flutter/material.dart';

showSuccessSnackbar({
  required BuildContext context,
  String? content,
}) {
  ScaffoldMessenger.of(context)
    ..clearSnackBars()
    ..showSnackBar(
      SnackBar(
        showCloseIcon: true,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        content: Text(content ?? ''),
      ),
    );
}
