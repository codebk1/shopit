import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/utils/async_value.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';
import 'package:shopit/src/features/account/presentation/widgets/edit_account_form.dart';

class EditAccountPage extends ConsumerWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      accountControllerProvider,
      (_, next) {
        next.showAlertDialogOnError(context);
        next.showSnackbarOnSuccess(
          context,
          context.l10n.editAccountSuccess,
        );
      },
    );

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.editAccountAppBarTitle,
        showActions: false,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(14),
        child: EditAccountForm(),
      ),
    );
  }
}
