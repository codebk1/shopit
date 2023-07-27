import 'package:flutter/material.dart';

import 'package:shopit/src/l10n/l10n.dart';

class ProductsListItemError extends StatelessWidget {
  const ProductsListItemError({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      height: 75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.l10n.productsListItemError,
            ),
          ),
        ],
      ),
    );
  }
}
