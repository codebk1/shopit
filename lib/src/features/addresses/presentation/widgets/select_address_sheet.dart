import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class SelectAddressSheet extends ConsumerWidget {
  const SelectAddressSheet({
    super.key,
    required this.currentAddress,
  });

  final Address currentAddress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressesController = ref.watch(
      addressesControllerProvider(currentAddress.type),
    );

    return addressesController.when(
      skipLoadingOnRefresh: false,
      data: (addresses) => addresses.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SvgIcon(
                    width: 45,
                    iconName: 'information',
                  ),
                  gapH16,
                  Text(context.l10n.addressesEmptyState),
                  IconButton(
                    onPressed: () => ref.invalidate(
                      addressesControllerProvider(currentAddress.type),
                    ),
                    icon: const SvgIcon(iconName: 'reload'),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final address = addresses[index];

                return RadioListTile<String?>(
                  value: address.id,
                  groupValue: currentAddress.id,
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
                            Text(context.l10n.addressesNIPLabel),
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
      loading: () => const ListLoader(),
    );
  }
}
