import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class AddressesPage extends ConsumerStatefulWidget {
  const AddressesPage({super.key});

  @override
  ConsumerState<AddressesPage> createState() => _AddressesPageState();
}

class _AddressesPageState extends ConsumerState<AddressesPage> {
  Future<void> _submit(Address address) {
    final addressesController = ref.read(
      addressesControllerProvider(address.type).notifier,
    );

    return address.id == null
        ? addressesController.add(address)
        : addressesController.set(address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.addressesAppBarTitle,
        showActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: CustomScrollView(
          slivers: [
            for (var type in AddressType.values)
              SliverMainAxisGroup(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: AddressesHeaderDelegate(
                        title: type == AddressType.delivery
                            ? context.l10n.addressesDeliveryAddressesHeader
                            : context.l10n.addressesPaymentAddressesHeader,
                        type: type,
                        submit: _submit),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      final provider = addressesControllerProvider(type);
                      final profile =
                          ref.watch(profileControllerProvider).value!;

                      final defaultAddressId = type == AddressType.delivery
                          ? profile.deliveryAddress
                          : profile.paymentAddress;

                      final aspectRatio =
                          type == AddressType.delivery ? 1.0 : 0.9;

                      return ref.watch(provider).when(
                            skipLoadingOnRefresh: false,
                            data: (addresses) => addresses.isNotEmpty
                                ? SliverGrid.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: aspectRatio,
                                    ),
                                    itemCount: addresses.length,
                                    itemBuilder: (context, index) {
                                      final address = addresses[index];

                                      return AddressGridItem(
                                        address: address,
                                        submit: _submit,
                                        isDefault:
                                            address.id == defaultAddressId,
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
                            loading: () => SliverToBoxAdapter(
                              child: GridLoader(
                                aspectRatio: aspectRatio,
                              ),
                            ),
                          );
                    },
                  ),
                  sliverGapH14,
                ],
              ),
          ],
        ),
      ),
    );
  }
}
