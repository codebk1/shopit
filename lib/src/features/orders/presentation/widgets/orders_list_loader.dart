import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/constants.dart';

class OrdersListLoader extends ConsumerWidget {
  const OrdersListLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
      baseColor: shimmerDarkBaseColor(ref),
      highlightColor: shimmerDarkHighlightColor(ref),
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 14),
        itemCount: 8,
        shrinkWrap: true,
        separatorBuilder: (_, index) => (index + 1) % 4 == 0 ? gapH24 : gapH8,
        itemBuilder: (_, index) {
          return Container(
            height: index % 4 == 0 ? 30 : 100,
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
