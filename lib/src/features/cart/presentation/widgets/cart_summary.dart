import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/utils/currency_formatter.dart';
import 'package:shopit/src/common/widgets/shimmer_text.dart';
import 'package:shopit/src/features/cart/application/controllers/cart_controller.dart';

class CartSummary extends ConsumerWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartSubtotal = ref.watch(cartSubtotalProvider);
    final shipping = ref.watch(cartControllerProvider.select(
      (cart) => cart.value!.shipping,
    ));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Subtotal'),
            cartSubtotal.when(
              skipLoadingOnReload: true,
              data: (subtotal) => Text(
                ref.read(currencyFormatterProvider).format(subtotal),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              loading: () => const ShimmerText(
                width: 80,
                dark: true,
              ),
              error: (_, __) => const Text(
                'Can\'t load subtotal value.',
              ),
            ),
          ],
        ),
        gapH14,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Shipping estimate'),
            Text(
              ref.read(currencyFormatterProvider).format(shipping),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        gapH24,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Order total'),
            cartSubtotal.when(
              skipLoadingOnReload: true,
              data: (subtotal) => Text(
                ref.read(currencyFormatterProvider).format(subtotal + shipping),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              loading: () => const ShimmerText(
                height: 24,
                width: 100,
                dark: true,
              ),
              error: (_, __) => const Text(
                'Can\'t load total value.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
