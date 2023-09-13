import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopit/src/constants/constants.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class SelectDefaultAddressSheet extends ConsumerWidget {
  const SelectDefaultAddressSheet({
    super.key,
    required this.currentAddress,
    required this.addressType,
  });

  final Address? currentAddress;
  final AddressType addressType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressesController = ref.watch(
      addressesControllerProvider(addressType),
    );

    return addressesController.when(
      data: (addresses) => ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];

          return RadioListTile<String?>(
            value: address.id,
            groupValue: currentAddress?.id,
            title: Text(address.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${address.street}, ${address.postalCode}, ${address.city}',
                ),
                if (address.nip!.isNotEmpty)
                  Row(
                    children: [
                      const Text('NIP:'),
                      gapW4,
                      Text(address.nip!),
                    ],
                  ),
                Row(
                  children: [
                    const SvgIcon(iconName: 'phone', width: 16),
                    gapW4,
                    Text(address.phone),
                    gapW6,
                    const SvgIcon(iconName: 'email', width: 16),
                    gapW4,
                    Text(address.email),
                  ],
                ),
              ],
            ),
            onChanged: (_) => context.pop(address),
          );
        },
      ),
      error: (error, _) => Text(
        errorMessage(error, context),
      ),
      loading: () => const ListViewLoader(),
    );
  }
}
