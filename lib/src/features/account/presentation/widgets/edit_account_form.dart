import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/auth/presentation/widgets/first_name_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/last_name_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/email_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/password_field.dart';
import 'package:shopit/src/features/auth/presentation/widgets/confirm_password_field.dart';
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          gapH24,
          Text(context.l10n.editAccountDontChangePasswordInfo),
          gapH10,
          PasswordField(
            controller: _passwordController,
            validate: false,
          ),
          gapH10,
          ConfirmPasswordField(
            controller: _confirmPasswordController,
            controllerToCompare: _passwordController,
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
