import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/features/profile/profile.dart';

class EditProfileSheet extends ConsumerWidget {
  const EditProfileSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      profileControllerProvider,
      (_, next) {
        next.showAlertDialogOnError(context);
        next.showSnackbarOnSuccess(
          context,
          context.l10n.profileEditSuccess,
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14)
          .add(MediaQuery.of(context).viewInsets),
      child: const EditProfileForm(),
    );
  }
}
