import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountController = ref.watch(accountControllerProvider);

    return Scaffold(
      appBar: const MainAppBar(
        title: 'Account',
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
        ),
        child: accountController.when(
          data: (data) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (data != null)
                        Row(
                          children: [
                            const Text('Hello, '),
                            Text(
                              '${data.firstName} ${data.lastName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      IconButton(
                        onPressed: accountController.isLoading
                            ? null
                            : () => ref
                                .read(accountControllerProvider.notifier)
                                .logout(),
                        icon: SvgPicture.asset('assets/icons/logout.svg'),
                      ),
                    ],
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
                          trailing: SvgPicture.asset(
                              'assets/icons/chevron-right.svg'),
                          onTap: () => context.go('/account/edit'),
                        ),
                        ListTile(
                          leading: SvgPicture.asset('assets/icons/orders.svg'),
                          title: const Text('My orders'),
                          trailing: SvgPicture.asset(
                              'assets/icons/chevron-right.svg'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset('assets/icons/cog.svg'),
                          title: const Text('Settings'),
                          trailing: SvgPicture.asset(
                              'assets/icons/chevron-right.svg'),
                          onTap: () {},
                        ),
                      ]),
                ),
              ],
            );
          },
          error: (error, stackTrace) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Error occured. Try again.'),
              IconButton(
                onPressed: () => ref.refresh(accountControllerProvider.future),
                icon: SvgPicture.asset('assets/icons/reload.svg'),
              )
            ],
          ),
          loading: () => const Center(
            child: Loader(dark: true),
          ),
        ),
      ),
    );
  }
}
