import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';
import 'package:shopit/src/features/account/application/controllers/edit_account_controller.dart';

class EditAccountForm extends ConsumerStatefulWidget {
  const EditAccountForm({super.key});

  @override
  ConsumerState<EditAccountForm> createState() => _EditAccountFormState();
}

class _EditAccountFormState extends ConsumerState<EditAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final accountController = ref.read(accountControllerProvider);
    final authController = ref.read(authControllerProvider);

    _firstNameController.text = accountController.value!.firstName;
    _lastNameController.text = accountController.value!.lastName;
    _emailController.text = authController.value!.email ?? '';
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

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newAccount = ref.read(accountControllerProvider).value!.copyWith(
            firstName: _firstNameController.text,
            lastName: _lastNameController.text,
          );

      ref.read(editAccountControllerProvider.notifier).updateAccount(
            ref.read(authControllerProvider).value!,
            _emailController.text,
            _confirmPasswordController.text,
            newAccount,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  decoration: const InputDecoration(
                    labelText: 'Firstname',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Firstname is required';
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
                  decoration: const InputDecoration(
                    labelText: 'Lastname',
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lastname is required';
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
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          gapH24,
          const Text(
            'Leave empty if You don\'t want to change password.',
          ),
          gapH10,
          TextFormField(
            controller: _passwordController,
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'New password',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          gapH10,
          TextFormField(
            controller: _confirmPasswordController,
            autocorrect: false,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm new password',
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value != _passwordController.text) {
                return 'Passwords don\'t match';
              }

              return null;
            },
          ),
          gapH14,
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(editAccountControllerProvider);

              return ElevatedButton(
                onPressed: _submit,
                child: state.isLoading ? const Loader() : const Text('Save'),
              );
            },
          ),
        ],
      ),
    );
  }
}
