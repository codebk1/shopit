import 'package:flutter/material.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: category.name,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 14,
          left: 14,
          right: 14,
        ),
        child: Column(
          children: [
            ProductsHeader(categoryId: category.id),
            gapH14,
            Expanded(
              child: ProductsGrid(categoryId: category.id),
            ),
          ],
        ),
      ),
    );
  }
}
