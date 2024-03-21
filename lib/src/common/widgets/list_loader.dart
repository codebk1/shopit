import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class ListLoader extends StatelessWidget {
  const ListLoader({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainer.withAlpha(150),
      highlightColor:
          Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
      child: ListView.separated(
        padding: const EdgeInsets.only(bottom: 14),
        itemCount: itemCount,
        separatorBuilder: (_, __) => gapH8,
        itemBuilder: (_, __) {
          return Container(
            height: 75,
            margin: const EdgeInsets.symmetric(horizontal: 14),
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
