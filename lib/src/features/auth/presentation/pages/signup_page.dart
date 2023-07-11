import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/constants/spacing.dart';

import 'package:shopit/src/utils/async_value_dialog.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/auth/presentation/widgets/signup_form.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      authControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: const MainAppBar(
        title: 'Sign Up',
        showActions: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          top: 24,
          bottom: 24,
        ),
        child: Column(
          children: [
            const SignupForm(),
            gapH24,
            Row(
              children: [
                const Text('Already have an account?'),
                gapW8,
                GestureDetector(
                  onTap: () => context.replace('/login'),
                  child: Text(
                    'Log in',
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
