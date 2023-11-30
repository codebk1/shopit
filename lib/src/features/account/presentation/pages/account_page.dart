import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/account/account.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.accountAppBarTitle,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final authController = ref.watch(authControllerProvider);
                final profileController = ref.watch(profileControllerProvider);

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 14),
                  padding: const EdgeInsets.only(left: 14),
                  decoration: BoxDecoration(
                    // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
                    color: surfaceContainer(ref),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      profileController.when(
                        data: (profile) => Row(
                          children: [
                            Text(context.l10n.profileGreetings),
                            Text(
                              '${profile?.firstName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        error: (_, __) => Text(
                          context.l10n.profileGreetingsLoadingError,
                        ),
                        loading: () => const ShimmerText(width: 200),
                      ),
                      IconButton(
                        onPressed: authController.isLoading
                            ? null
                            : ref.read(authControllerProvider.notifier).signOut,
                        icon: authController.isLoading
                            ? const Loader(dark: true)
                            : const SvgIcon(iconName: 'logout'),
                      ),
                    ],
                  ),
                );
              },
            ),
            gapH24,
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  AccountMenuItem(
                    title: context.l10n.profileMenuItemTitle,
                    iconName: 'profile',
                    route: Routes.profile.name,
                  ),
                  AccountMenuItem(
                    title: context.l10n.ordersMenuItemTitle,
                    iconName: 'orders',
                    route: Routes.orders.name,
                  ),
                  AccountMenuItem(
                    title: context.l10n.addressesMenuItemTitle,
                    iconName: 'addresses',
                    route: Routes.addresses.name,
                  ),
                  AccountMenuItem(
                    title: context.l10n.settingsMenuItemTitle,
                    iconName: 'cog',
                    route: Routes.settings.name,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
