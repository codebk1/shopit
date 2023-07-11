import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Account',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onInverseSurface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final account = ref.watch(accountControllerProvider);
                  final authController = ref.watch(authControllerProvider);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      account.when(
                        data: (data) => Row(
                          children: [
                            const Text('Hello, '),
                            Text(
                              '${data?.firstName} ${data?.lastName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        error: (error, stackTrace) => Text(error.toString()),
                        loading: () => const Loader(
                          dark: true,
                        ),
                      ),
                      IconButton(
                        onPressed:
                            ref.read(authControllerProvider.notifier).logout,
                        icon: authController.isLoading
                            ? const Loader(
                                dark: true,
                              )
                            : SvgPicture.asset(
                                'assets/icons/logout.svg',
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
            gapH24,
            Expanded(
              child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/account.svg'),
                      title: const Text('Account'),
                      trailing:
                          SvgPicture.asset('assets/icons/chevron-right.svg'),
                      onTap: () => context.go('/account/edit'),
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/orders.svg'),
                      title: const Text('My orders'),
                      trailing:
                          SvgPicture.asset('assets/icons/chevron-right.svg'),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset('assets/icons/cog.svg'),
                      title: const Text('Settings'),
                      trailing:
                          SvgPicture.asset('assets/icons/chevron-right.svg'),
                      onTap: () {},
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
