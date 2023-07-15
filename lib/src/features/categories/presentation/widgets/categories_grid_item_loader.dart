import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class CategoriesGridItemLoader extends StatelessWidget {
  const CategoriesGridItemLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.onInverseSurface,
      highlightColor:
          Theme.of(context).colorScheme.onInverseSurface.withAlpha(50),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
