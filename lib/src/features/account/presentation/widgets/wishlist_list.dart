import 'package:flutter/material.dart';

import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/account/presentation/widgets/wishlist_item.dart';

class WishlistList extends StatelessWidget {
  const WishlistList({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return WishlistItem(
          product: products[index],
        );
      },
    );
  }
}
