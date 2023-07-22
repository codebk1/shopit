import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/colors.dart';

class CategoriesGridItemLoader extends StatelessWidget {
  const CategoriesGridItemLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerDarkBaseColor,
      highlightColor: shimmerDarkHighlightColor,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
