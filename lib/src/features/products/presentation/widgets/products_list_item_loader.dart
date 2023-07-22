import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';

class ProductsListItemLoader extends StatelessWidget {
  const ProductsListItemLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerDarkBaseColor,
      highlightColor: shimmerDarkHighlightColor,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Container(
              height: 75,
              width: 85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            gapW10,
            Expanded(
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
