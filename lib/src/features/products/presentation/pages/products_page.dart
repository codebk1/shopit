import 'package:flutter/material.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/features/categories/domain/entities/category.dart';
import 'package:shopit/src/features/products/presentation/widgets/products_header.dart';
import 'package:shopit/src/features/products/presentation/widgets/products_grid.dart';

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
