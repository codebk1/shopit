import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';

import 'package:shopit/src/utils/async_value_dialog.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';
import 'package:shopit/src/features/account/application/controllers/edit_account_controller.dart';
import 'package:shopit/src/features/account/presentation/widgets/edit_account_form.dart';

class EditAccountPage extends ConsumerWidget {
  const EditAccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      editAccountControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    ref.listen(
      accountControllerProvider,
      (previous, next) {
        if (!next.isLoading && !next.hasError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar
            ..showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 2),
                content: Text(
                  'Successfully edited account.',
                ),
              ),
            );
        }
      },
    );

    return const Scaffold(
      appBar: MainAppBar(
        title: 'Edit account',
        showActions: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: 14,
          right: 14,
          top: 24,
          bottom: 24,
        ),
        child: EditAccountForm(),
      ),
    );
  }
}
