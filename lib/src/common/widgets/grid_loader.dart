import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class GridLoader extends StatelessWidget {
  const GridLoader({
    super.key,
    this.itemCount = 4,
    this.crossAxisCount = 2,
    this.aspectRatio = 1,
    this.mainAxisSpacing = 10,
    this.crossAxisSpacing = 10,
  });

  final int itemCount;
  final int crossAxisCount;
  final double aspectRatio;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainer.withAlpha(150),
      highlightColor:
          Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
      child: GridView.builder(
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: aspectRatio,
        ),
        shrinkWrap: true,
        itemBuilder: (_, __) {
          return Container(
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
