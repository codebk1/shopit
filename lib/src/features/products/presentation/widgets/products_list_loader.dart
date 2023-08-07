import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/constants.dart';

class ProductsListLoader extends ConsumerWidget {
  const ProductsListLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
      baseColor: shimmerDarkBaseColor(ref),
      highlightColor: shimmerDarkHighlightColor(ref),
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 14),
        itemCount: 6,
        separatorBuilder: (_, __) => gapH8,
        itemBuilder: (_, __) {
          return Container(
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
          );
        },
      ),
    );
  }
}
