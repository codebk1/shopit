import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/validator/validator.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: context.l10n.inputEmailLabel,
      ),
      validator: (value) => one([
        () => isNotEmpty(value, context.l10n.inputEmailIsRequired),
        () => isEmailValid(value, context.l10n.inputEmailIsWrong),
      ]),
    );
  }
}
