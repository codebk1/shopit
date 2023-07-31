import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/colors.dart';

class ShimmerText extends ConsumerWidget {
  const ShimmerText({
    super.key,
    this.lines = 1,
    this.height = 20,
    required this.width,
    this.dark = false,
  });

  final int lines;
  final double height;
  final double width;
  final bool dark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
    return Shimmer.fromColors(
      baseColor: dark ? shimmerDarkBaseColor(ref) : shimmerLightBaseColor,
      highlightColor: dark
          ? shimmerDarkHighlightColor(ref)
          : shimmerLightHighlightColor(ref),
      child: Column(
        children: [
          for (int i = 0; i < lines; i++)
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}
