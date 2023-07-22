import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/colors.dart';

class ProductsGridLoader extends StatelessWidget {
  const ProductsGridLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerDarkBaseColor,
      highlightColor: shimmerDarkHighlightColor,
      child: GridView.builder(
        padding: const EdgeInsets.only(bottom: 14),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        shrinkWrap: true,
        itemBuilder: (_, __) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
