import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/auth/presentation/widgets/first_name_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/last_name_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/email_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/password_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/confirm_password_field.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  var _autovalidateMode = AutovalidateMode.disabled;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).signup(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
            email: _emailController.text,
            password: _confirmPasswordController.text,
          );
    }

    setState(() {
      _autovalidateMode = AutovalidateMode.onUserInteraction;
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FirstNameField(controller: _firstNameController),
              ),
              gapW10,
              Expanded(
                child: LastNameField(controller: _lastNameController),
              ),
            ],
          ),
          gapH10,
          EmailField(controller: _emailController),
          gapH10,
          PasswordField(controller: _passwordController),
          gapH10,
          ConfirmPasswordField(
            controller: _confirmPasswordController,
            controllerToCompare: _passwordController,
          ),
          gapH14,
          Consumer(
            builder: (context, ref, child) {
              final authController = ref.watch(authControllerProvider);

              return ElevatedButton(
                onPressed: _submit,
                child: authController.isLoading
                    ? const Loader()
                    : Text(context.l10n.signupButton),
              );
            },
          ),
        ],
      ),
    );
  }
}
