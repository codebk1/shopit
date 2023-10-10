import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/features/checkout/checkout.dart';

class CartListItemQuantity extends ConsumerWidget {
  const CartListItemQuantity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(cartItemProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Text(
        'x ${item.quantity}',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
