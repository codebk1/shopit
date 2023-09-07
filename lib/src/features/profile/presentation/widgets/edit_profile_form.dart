import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
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

  Future<void>? _updateProfile;
  String? _selectedAvatar;

  @override
  void initState() {
    super.initState();

    final profile = ref.read(profileControllerProvider).value;

    if (profile != null) {
      _firstNameController.text = profile.firstName;
      _lastNameController.text = profile.lastName;
    }

    _loadAvatar();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  void _loadAvatar() async {
    final currentAvatarPath =
        ref.read(profileControllerProvider).requireValue?.avatar;

    if (currentAvatarPath == null) return;

    final currentAvatar = await DefaultCacheManager().getSingleFile(
      currentAvatarPath,
    );

    setState(() {
      _selectedAvatar = currentAvatar.path;
    });
  }

  void _selectAvatar() async {
    final ImagePicker picker = ImagePicker();

    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 250,
    );

    if (image != null) {
      setState(() {
        _selectedAvatar = image.path;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final profile = ref.read(profileControllerProvider).value;

      if (profile != null) {
        final newProfile = profile.copyWith(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          avatar: _selectedAvatar,
        );

        setState(() {
          _updateProfile = ref
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
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: _selectAvatar,
                child: Container(
                  width: 80,
                  height: 80,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: _selectedAvatar != null
                      ? Image.file(
                          File(_selectedAvatar!),
                          fit: BoxFit.cover,
                        )
                      : const Center(
                          child: SvgIcon(
                            iconName: 'account',
                          ),
                        ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Material(
                  type: MaterialType.transparency,
                  child: Ink(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 1,
                      ),
                      color: Theme.of(context).colorScheme.errorContainer,
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(1000),
                      onTap: () {
                        setState(() {
                          _selectedAvatar = null;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: SvgIcon(
                          iconName: 'trash',
                          color: Theme.of(context).colorScheme.onErrorContainer,
                          width: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          gapH36,
          FirstNameField(controller: _firstNameController),
          gapH10,
          LastNameField(controller: _lastNameController),
          gapH14,
          FutureBuilder(
            future: _updateProfile,
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
