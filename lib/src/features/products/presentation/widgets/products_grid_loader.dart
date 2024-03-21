import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ProductsGridLoader extends StatelessWidget {
  const ProductsGridLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainer.withAlpha(150),
      highlightColor:
          Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
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
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          );
        },
      ),
    );
  }
}
