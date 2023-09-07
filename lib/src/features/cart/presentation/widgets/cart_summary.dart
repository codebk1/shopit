import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/cart/cart.dart';

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
            Text(context.l10n.cartSubtotalHeader),
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
              error: (_, __) => Text(context.l10n.cartSubtotalLoadingError),
            ),
          ],
        ),
        gapH14,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(context.l10n.cartShippingCostHeader),
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
            Text(context.l10n.cartTotalHeader),
            cartSubtotal.when(
              skipLoadingOnReload: true,
              data: (subtotal) => Text(
                ref.read(currencyFormatterProvider).format(subtotal + shipping),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              loading: () => const ShimmerText(
                width: 100,
                lineHeight: 24,
                dark: true,
              ),
              error: (_, __) => Text(context.l10n.cartTotalLoadingError),
            ),
          ],
        ),
      ],
    );
  }
}
