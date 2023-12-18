import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class GridLoader extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
      baseColor: shimmerDarkBaseColor(ref),
      highlightColor: shimmerDarkHighlightColor(ref),
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
