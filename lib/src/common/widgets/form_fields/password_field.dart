import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/auth/auth.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
    this.validate = true,
  });

  final TextEditingController controller;
  final bool validate;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final showPassword = ref.watch(showPasswordControllerProvider);

        return TextFormField(
          controller: controller,
          autocorrect: false,
          obscureText: !showPassword,
          decoration: InputDecoration(
            labelText: context.l10n.inputPasswordLabel,
            suffixIcon: IconButton(
              onPressed:
                  ref.read(showPasswordControllerProvider.notifier).toggle,
              icon: SvgIcon(
                iconName: showPassword ? 'eye' : 'eye-slash',
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
          validator: validate
              ? (value) => one([
                    () =>
                        isNotEmpty(value, context.l10n.inputPasswordIsRequired)
                  ])
              : null,
        );
      },
    );
  }
}
