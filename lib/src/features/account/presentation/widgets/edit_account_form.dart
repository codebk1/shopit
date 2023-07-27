import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';

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

    final authRepository = ref.read(authRepositoryProvider);
    final account = ref.read(accountControllerProvider).value!;

    _firstNameController.text = account.firstName;
    _lastNameController.text = account.lastName;
    _emailController.text = authRepository.currentUser!.email!;
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

      ref.read(accountControllerProvider.notifier).updateAccount(
            _emailController.text,
            _confirmPasswordController.text,
            newAccount,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final accountController = ref.watch(accountControllerProvider);

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
          gapH24,
          Text(
            context.l10n.editAccountDontChangePasswordInfo,
          ),
          gapH10,
          TextFormField(
            controller: _passwordController,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              labelText: context.l10n.inputNewPasswordLabel,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          gapH10,
          TextFormField(
            controller: _confirmPasswordController,
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
              labelText: context.l10n.inputConfirmNewPasswordLabel,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value != _passwordController.text) {
                return context.l10n.inputPasswordsNotMatch;
              }

              return null;
            },
          ),
          gapH14,
          ElevatedButton(
            onPressed: accountController.isLoading ? null : _submit,
            child: accountController.isLoading
                ? const Loader()
                : Text(context.l10n.editAccountButton),
          ),
        ],
      ),
    );
  }
}
