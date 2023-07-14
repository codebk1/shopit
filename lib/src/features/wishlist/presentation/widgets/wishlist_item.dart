import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopit/src/features/products/application/controllers/products_controller.dart';

import 'package:shopit/src/features/products/data/repositories/products_repository.dart';
import 'package:shopit/src/features/products/presentation/widgets/product_list_item.dart';
import 'package:shopit/src/features/products/presentation/widgets/product_list_item_error.dart';
import 'package:shopit/src/features/products/presentation/widgets/product_list_item_loader.dart';

class WishlistItem extends ConsumerWidget {
  const WishlistItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ref.watch(productIdProvider);
    final product = ref.watch(productProvider(id));

    return Column(
      children: [
        product.when(
          data: (product) => ProductListItem(product: product!),
          error: (_, __) => const ProductListItemError(),
          loading: () => const ProductListItemLoader(),
        ),
      ],
    );
  }
}
