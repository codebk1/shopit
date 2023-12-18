import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

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
                  key: const Key('goToSignUpPageButton'),
                  onTap: () => context.replaceNamed(Routes.signup.name),
                  child: Text(
                    context.l10n.signInGoToSignUpPage,
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
