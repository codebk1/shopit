import 'dart:math';

import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';

class LatestOrderLoader extends StatelessWidget {
  const LatestOrderLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.surfaceContainer.withAlpha(1),
      highlightColor:
          Theme.of(context).colorScheme.surfaceContainer.withAlpha(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: max(24, MediaQuery.textScalerOf(context).scale(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          gapH10,
          Container(
            height: max(24, MediaQuery.textScalerOf(context).scale(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          gapH14,
          Container(
            height: 44 + MediaQuery.textScalerOf(context).scale(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          gapH14,
          Container(
            height: MediaQuery.textScalerOf(context).scale(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
