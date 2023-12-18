import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: context.l10n.inputPhoneLabel,
      ),
      validator: (value) => one([
        () => isNotEmpty(value, context.l10n.inputPhoneIsRequired),
      ]),
    );
  }
}
