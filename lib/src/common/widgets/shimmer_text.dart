import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  const ShimmerText({
    super.key,
    required this.width,
    double? oddLinesWidth,
    this.lines = 1,
    this.lineHeight = 15,
    this.gap = 5,
    this.extraHeight = 0,
    this.dark = false,
  }) : oddLinesWidth = oddLinesWidth ?? width;

  final double width;
  final double oddLinesWidth;
  final int lines;
  final double lineHeight;
  final double gap;
  final double extraHeight;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final scaledLineHeight = MediaQuery.textScalerOf(context).scale(lineHeight);

    return Shimmer.fromColors(
      baseColor: dark
          ? Theme.of(context).colorScheme.surfaceContainer.withAlpha(150)
          : Colors.white.withAlpha(100),
      highlightColor: dark
          ? Theme.of(context).colorScheme.surfaceContainer.withAlpha(50)
          : Theme.of(context).colorScheme.surfaceContainer.withAlpha(1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < lines; i++)
            Container(
              margin: EdgeInsets.only(bottom: i == lines - 1 ? 0 : gap),
              height: ((scaledLineHeight * lines - (lines - 1) * gap) +
                      extraHeight) /
                  lines,
              width: i.isEven ? width : oddLinesWidth,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
        ],
      ),
    );
  }
}
