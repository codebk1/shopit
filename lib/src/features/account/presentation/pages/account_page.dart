import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
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
      appBar: const MainAppBar(
        title: 'Account',
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
                            const Text('Hello, '),
                            Text(
                              '${account?.firstName} ${account?.lastName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        error: (_, __) => const Text(
                          'Can\'t load account name.',
                        ),
                        loading: () => const ShimmerText(width: 200),
                      ),
                      IconButton(
                        onPressed: authController.isLoading
                            ? null
                            : ref.read(authControllerProvider.notifier).logout,
                        icon: authController.isLoading
                            ? const Loader(dark: true)
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
                children: const [
                  AccountMenuItem(
                    title: 'Account',
                    icon: 'assets/icons/account.svg',
                    path: 'edit',
                  ),
                  AccountMenuItem(
                    title: 'My orders',
                    icon: 'assets/icons/orders.svg',
                    path: '',
                  ),
                  AccountMenuItem(
                    title: 'Settings',
                    icon: 'assets/icons/cog.svg',
                    path: '',
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
