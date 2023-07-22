import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/utils/async_value_messenger.dart';
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
        next.showSnackbarOnSuccess(context, 'Successfully edited account.');
      },
    );

    return const Scaffold(
      appBar: MainAppBar(
        title: 'Edit account',
        showActions: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14),
        child: EditAccountForm(),
      ),
    );
  }
}
