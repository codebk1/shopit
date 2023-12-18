import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class SelectAddressSection extends ConsumerWidget {
  const SelectAddressSection({
    super.key,
    required this.selectedAddressId,
    required this.type,
  });

  final String? selectedAddressId;
  final AddressType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(checkoutAddressProvider(selectedAddressId, type));

    ref.listen(checkoutAddressProvider(selectedAddressId, type), (_, next) {
      if (selectedAddressId == null && next.hasValue) {
        final address = next.valueOrNull;

        if (address != null) {
          ref.read(checkoutControllerProvider.notifier).setAddress(address);
        }
      }
    });

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: surfaceContainer(ref),
            borderRadius: BorderRadius.circular(8),
          ),
          child: address.when(
            data: (address) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: address != null
                    ? [
                        Expanded(
                          child: AddressData(
                            address: address,
                          ),
                        ),
                        AddressActionButton(
                          text: context.l10n.checkoutEditAddressButton,
                          address: address,
                        ),
                      ]
                    : [
                        Text(context.l10n.checkoutNoAddressSelectedText),
                        AddressActionButton(
                          select: true,
                          text: context.l10n.checkoutSelectAddressButton,
                          address: Address.empty(type),
                        ),
                      ],
              );
            },
            error: (error, _) => Text(
              errorMessage(error, context),
            ),
            loading: () => ShimmerText(
              width: 150,
              oddLinesWidth: 100,
              lines: type == AddressType.delivery ? 5 : 6,
              lineHeight: 20,
              extraHeight: 5,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddressActionButton(
              text: context.l10n.checkoutAddNewAddressButton,
              icon: 'arrow-small-right',
              address: Address.empty(type),
            ),
            AddressActionButton(
              select: true,
              text: context.l10n.checkoutSelectDifferentAddressButton,
              icon: 'arrow-small-right',
              address: address.valueOrNull ?? Address.empty(type),
            ),
          ],
        ),
      ],
    );
  }
}
