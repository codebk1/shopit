import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class CategoriesGridLoader extends StatelessWidget {
  const CategoriesGridLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainer.withAlpha(150),
      highlightColor:
          Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 14,
          left: 14,
          right: 14,
        ),
        child: Column(
          children: [
            Container(
              height: 48,
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            gapH14,
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 14),
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (_, __) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
