import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/features/auth/application/controllers/show_password_controller.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

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
              onPressed: () =>
                  ref.read(showPasswordControllerProvider.notifier).toggle(),
              icon: SvgPicture.asset(
                showPassword
                    ? 'assets/icons/eye.svg'
                    : 'assets/icons/eye-slash.svg',
                colorFilter: ColorFilter.mode(
                  Theme.of(context).hintColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context.l10n.inputPasswordIsRequired;
            }
            return null;
          },
        );
      },
    );
  }
}
