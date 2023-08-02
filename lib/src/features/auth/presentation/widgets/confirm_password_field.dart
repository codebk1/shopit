import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/validator/validator.dart';

class ConfirmPasswordField extends StatelessWidget {
  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.controllerToCompare,
  });

  final TextEditingController controller;
  final TextEditingController controllerToCompare;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      obscureText: true,
      decoration: InputDecoration(
        labelText: context.l10n.inputConfirmPasswordLabel,
      ),
      validator: (value) => one([
        () => notMatch(value, controllerToCompare.text,
            context.l10n.inputPasswordsNotMatch),
      ]),
    );
  }
}
