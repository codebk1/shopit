import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.profileAppBarTitle,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (_) => const EditProfileSheet(),
              );
            },
            icon: const SvgIcon(iconName: 'edit'),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          right: 14,
          top: 14,
        ),
        child: Column(
          children: [
            const ProfileBox(),
            gapH24,
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Column(
                    children: [
                      const ActiveOrderBox(),
                      gapH24,
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        shrinkWrap: true,
                        children: const [
                          StatsBox(
                            name: 'placed orders',
                            value: '123',
                            iconName: 'orders',
                          ),
                          StatsBox(
                            name: 'reviews',
                            value: '14',
                            iconName: 'reviews',
                          ),
                        ],
                      ),
                      gapH24,
                      Column(
                        children: [
                          DefaultAddressBox(
                            header: context
                                .l10n.profileDefaultDeliveryAddressBoxHeader,
                            type: AddressType.delivery,
                          ),
                          gapH24,
                          DefaultAddressBox(
                            header: context
                                .l10n.profileDefaultPaymentAddressBoxHeader,
                            type: AddressType.payment,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
