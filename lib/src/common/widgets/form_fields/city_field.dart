import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/utils.dart';

class CityField extends StatelessWidget {
  const CityField({
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
        labelText: context.l10n.inputCityLabel,
      ),
      validator: (value) => one([
        () => isNotEmpty(value, context.l10n.inputCityIsRequired),
      ]),
    );
  }
}
