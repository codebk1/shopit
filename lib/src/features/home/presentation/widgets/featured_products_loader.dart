import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/constants.dart';

class FeaturedProductsLoader extends ConsumerWidget {
  const FeaturedProductsLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
      baseColor: shimmerDarkBaseColor(ref),
      highlightColor: shimmerDarkHighlightColor(ref),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        separatorBuilder: (_, __) => gapW8,
        itemBuilder: (_, __) {
          return Container(
            width: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          );
        },
      ),
    );
  }
}
