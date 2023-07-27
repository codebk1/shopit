import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/auth/presentation/widgets/password_field.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({super.key});

  @override
  ConsumerState<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends ConsumerState<SignupForm> {
  final _formKey = GlobalKey<FormState>();
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
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstNameController,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: context.l10n.inputFirstnameLabel,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.inputFirstnameIsRequired;
                    }
                    return null;
                  },
                ),
              ),
              gapW10,
              Expanded(
                child: TextFormField(
                  controller: _lastNameController,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: context.l10n.inputLastnameLabel,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return context.l10n.inputLastnameIsRequired;
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          gapH10,
          TextFormField(
            controller: _emailController,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: context.l10n.inputEmailLabel,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.inputEmailIsRequired;
              }
              return null;
            },
          ),
          gapH10,
          PasswordField(controller: _passwordController),
          gapH10,
          TextFormField(
            controller: _confirmPasswordController,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              labelText: context.l10n.inputConfirmPasswordLabel,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.l10n.inputConfirmPasswordIsRequired;
              }

              if (value != _passwordController.text) {
                return context.l10n.inputPasswordsNotMatch;
              }
              return null;
            },
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
