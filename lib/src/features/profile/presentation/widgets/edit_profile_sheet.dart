import 'package:flutter/material.dart';

import 'package:shopit/src/features/profile/profile.dart';

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 14,
      ).add(MediaQuery.viewInsetsOf(context)),
      child: const EditProfileForm(),
    );
  }
}
