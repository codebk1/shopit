import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _autovalidateMode = AutovalidateMode.disabled;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ref.read(authControllerProvider.notifier).signUp(
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
                    : Text(context.l10n.signUpButton),
              );
            },
          ),
        ],
      ),
    );
  }
}
