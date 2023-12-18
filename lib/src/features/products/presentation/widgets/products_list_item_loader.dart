import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class ProductsListItemLoader extends ConsumerWidget {
  const ProductsListItemLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
      baseColor: shimmerDarkBaseColor(ref),
      highlightColor: shimmerDarkHighlightColor(ref),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Container(
              height: 75,
              width: 85,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            gapW10,
            Expanded(
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
