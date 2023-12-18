import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';

class StreetField extends StatelessWidget {
  const StreetField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autocorrect: false,
      keyboardType: TextInputType.streetAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: context.l10n.inputStreetLabel,
      ),
      validator: (value) => one([
        () => isNotEmpty(value, context.l10n.inputStreetIsRequired),
      ]),
    );
  }
}
