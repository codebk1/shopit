import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class FeaturedCategoriesLoader extends StatelessWidget {
  const FeaturedCategoriesLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainer.withAlpha(150),
      highlightColor:
          Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => gapW8,
        itemBuilder: (_, __) {
          return Container(
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
