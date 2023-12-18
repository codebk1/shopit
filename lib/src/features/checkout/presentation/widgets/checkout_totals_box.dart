import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class CheckoutTotalsBox extends ConsumerWidget {
  const CheckoutTotalsBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkout = ref.watch(checkoutControllerProvider).requireValue;
    final carrier = ref.watch(carrierProvider(checkout.carrierId!)).valueOrNull;
    final payment = ref.watch(paymentProvider(checkout.paymentId!)).valueOrNull;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n.checkoutTotalsBoxProductsLabel),
              Text(
                ref.read(currencyFormatterProvider).format(checkout.itemsTotal),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n.checkoutTotalsBoxDeliveryLabel),
              Text(
                ref.read(currencyFormatterProvider).format(carrier?.price ?? 0),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n.checkoutTotalsBoxPaymentLabel),
              Text(
                ref.read(currencyFormatterProvider).format(payment?.price ?? 0),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
