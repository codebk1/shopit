import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/svg_icon.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/common/widgets/shimmer_text.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';
import 'package:shopit/src/features/account/presentation/widgets/account_menu_item.dart';

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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              padding: const EdgeInsets.only(left: 14),
              decoration: BoxDecoration(
                color: surfaceContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Consumer(
                builder: (context, ref, child) {
                  final authController = ref.watch(authControllerProvider);
                  final account = ref.watch(accountControllerProvider);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      account.when(
                        skipError: true,
                        data: (account) => Row(
                          children: [
                            Text(context.l10n.accountGreetings),
                            Text(
                              '${account?.firstName} ${account?.lastName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        error: (_, __) => Text(
                          context.l10n.accountNameLoadingError,
                        ),
                        loading: () => const ShimmerText(width: 200),
                      ),
                      IconButton(
                        onPressed: authController.isLoading
                            ? null
                            : ref.read(authControllerProvider.notifier).logout,
                        icon: authController.isLoading
                            ? const Loader(dark: true)
                            : const SvgIcon(iconName: 'logout'),
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
                  AccountMenuItem(
                    title: context.l10n.accountEditAccountMenuItemTitle,
                    iconName: 'account',
                    route: Routes.accountEdit.name,
                  ),
                  AccountMenuItem(
                    title: context.l10n.accountOrdersMenuItemTitle,
                    iconName: 'orders',
                    route: '',
                  ),
                  AccountMenuItem(
                    title: context.l10n.accountSettingsMenuItemTitle,
                    iconName: 'cog',
                    route: Routes.accountSettings.name,
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
