import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class SelectDeliveryGrid extends ConsumerWidget {
  const SelectDeliveryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkout = ref.watch(checkoutControllerProvider).requireValue;
    final carriers = ref.watch(carriersProvider);

    ref.listen(carriersProvider, (_, next) {
      if (checkout.carrierId == null && next.hasValue) {
        final carriers = next.valueOrNull;

        if (carriers != null) {
          ref
              .read(checkoutControllerProvider.notifier)
              .setCarrier(carriers.first);
        }
      }
    });

    return carriers.when(
      skipLoadingOnRefresh: false,
      data: (carriers) => SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 5,
        ),
        itemCount: carriers.length,
        itemBuilder: (context, index) {
          final carrier = carriers[index];

          return GestureDetector(
            onTap: () => ref
                .read(checkoutControllerProvider.notifier)
                .setCarrier(carrier),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: checkout.carrierId == carrier.id
                      ? Theme.of(context).colorScheme.primary
                      : const Color.fromARGB(0, 0, 0, 0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgIcon(
                    iconName: switch (carrier.type) {
                      CarrierType.selfPickup => 'home',
                      CarrierType.courier => 'truck-transit',
                      CarrierType.parcelLocker => 'parcel-locker',
                    },
                    width: 35,
                  ),
                  Text(
                    carrier.name,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ref.read(currencyFormatterProvider).format(carrier.price),
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          );
        },
      ),
      error: (error, _) => SliverToBoxAdapter(
        child: ErrorBox(
          error: error,
          onRefresh: () => ref.invalidate(carriersProvider),
          height: 145,
        ),
      ),
      loading: () => const SliverToBoxAdapter(
        child: GridLoader(
          itemCount: 3,
          crossAxisCount: 3,
          aspectRatio: 4 / 5,
        ),
      ),
    );
  }
}
