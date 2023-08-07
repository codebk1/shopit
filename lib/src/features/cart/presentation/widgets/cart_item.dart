import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/features/products/products.dart';
import 'package:shopit/src/features/cart/cart.dart';

class CartItem extends ConsumerWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.read(cartItemProvider);
    final product = ref.watch(productProvider(item.id));

    return Column(
      children: [
        product.when(
            data: (product) => ProductsListItem(
                  product: product!,
                  widgets: const [QuantitySelector()],
                ),
            error: (_, __) => const ProductsListItemError(),
            loading: () => const ProductsListItemLoader()),
      ],
    );
  }
}
