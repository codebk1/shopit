import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopit/src/features/profile/profile.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class AddressesPage extends ConsumerWidget {
  const AddressesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.addressesAppBarTitle,
        showActions: false,
      ),
      body: CustomScrollView(
        slivers: [
          for (var type in AddressType.values)
            SliverPadding(
              padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
              sliver: SliverMainAxisGroup(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: AddressesHeaderDelegate(
                      title: type == AddressType.delivery
                          ? context.l10n.addressesDeliveryAddressesHeader
                          : context.l10n.addressesBillingAddressesHeader,
                      sheet: AddressSheet(type: type),
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final provider = addressesControllerProvider(type);
                      final profile =
                          ref.watch(profileControllerProvider).value!;

                      return ref.watch(provider).when(
                            skipLoadingOnRefresh: false,
                            data: (addresses) => addresses.isNotEmpty
                                ? SliverGrid.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                    ),
                                    itemCount: addresses.length,
                                    itemBuilder: (context, index) {
                                      final address = addresses[index];

                                      return AddressGridItem(
                                        address: address,
                                        isDefault: address.id ==
                                            (type == AddressType.delivery
                                                ? profile.deliveryAddress
                                                : profile.billingAddress),
                                      );
                                    },
                                  )
                                : SliverToBoxAdapter(
                                    child: AddressesGridEmpty(
                                      onRefresh: () => ref.invalidate(provider),
                                    ),
                                  ),
                            error: (_, __) => SliverToBoxAdapter(
                              child: AddressesGridError(
                                onRefresh: () => ref.invalidate(provider),
                              ),
                            ),
                            loading: () => const SliverToBoxAdapter(
                              child: AddressesGridLoader(),
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
