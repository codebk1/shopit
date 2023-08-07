import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/auth/auth.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(authControllerProvider, (_, next) {
      next.showAlertDialogOnError(context);
    });

    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.signInAppBarTitle,
        showActions: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            const SignInForm(),
            gapH24,
            Row(
              children: [
                Text(context.l10n.signInNoAccountQuestion),
                gapW8,
                GestureDetector(
                  onTap: () => context.replaceNamed(Routes.signup.name),
                  child: Text(
                    context.l10n.signInGoToSignupPage,
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
