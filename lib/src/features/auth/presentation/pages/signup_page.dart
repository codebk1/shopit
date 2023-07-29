import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/utils/async_value.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/auth/presentation/widgets/signup_form.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      authControllerProvider,
      (_, next) => next.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.signupAppBarTitle,
        showActions: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            const SignupForm(),
            gapH24,
            Row(
              children: [
                Text(context.l10n.signupAlreadyHaveAccount),
                gapW8,
                GestureDetector(
                  onTap: () => context.replaceNamed(Routes.login.name),
                  child: Text(
                    context.l10n.signupGoToLoginPage,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
