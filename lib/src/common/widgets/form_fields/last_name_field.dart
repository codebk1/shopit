import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({
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
      decoration: InputDecoration(
        labelText: context.l10n.inputLastNameLabel,
      ),
      validator: (value) => one([
        () => isNotEmpty(value, context.l10n.inputLastNameIsRequired),
      ]),
    );
  }
}
