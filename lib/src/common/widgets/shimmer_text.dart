import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopit/src/constants/colors.dart';

class ShimmerText extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: dark ? shimmerDarkBaseColor : shimmerLightBaseColor,
      highlightColor:
          dark ? shimmerDarkHighlightColor : shimmerLightHighlightColor,
      child: Column(
        children: [
          for (int i = 0; i < lines; i++)
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                color: dark ? surfaceContainer : Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}
