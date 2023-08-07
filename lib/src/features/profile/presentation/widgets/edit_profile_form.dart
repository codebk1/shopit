import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({super.key});

  @override
  ConsumerState<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final profile = ref.read(profileControllerProvider).value;

    if (profile != null) {
      _firstNameController.text = profile.firstName;
      _lastNameController.text = profile.lastName;
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  Future<void>? updateFuture;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final profile = ref.read(profileControllerProvider).value;

      if (profile != null) {
        final newProfile = profile.copyWith(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
        );

        setState(() {
          updateFuture = ref
              .read(profileControllerProvider.notifier)
              .updateProfile(newProfile);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FirstNameField(controller: _firstNameController),
          gapH10,
          LastNameField(controller: _lastNameController),
          gapH14,
          FutureBuilder(
            future: updateFuture,
            builder: (context, snapshot) {
              final isLoading =
                  snapshot.connectionState == ConnectionState.waiting;

              return ElevatedButton(
                onPressed: isLoading ? null : _submit,
                child: isLoading
                    ? const Loader()
                    : Text(context.l10n.profileEditButton),
              );
            },
          ),
        ],
      ),
    );
  }
}
