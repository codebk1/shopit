import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/features/products/products.dart';

class WishlistItem extends ConsumerWidget {
  const WishlistItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(productIdProvider);
    final product = ref.watch(productProvider(id));

    return product.when(
      data: (product) => ProductsListItem(product: product!),
      error: (_, __) => const ProductsListItemError(),
      loading: () => const ProductsListItemLoader(),
    );
  }
}
