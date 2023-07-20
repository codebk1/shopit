import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/colors.dart';

class FeaturedEmptyState extends StatelessWidget {
  const FeaturedEmptyState({
    super.key,
    this.isRow = false,
    required this.text,
    required this.onRefresh,
  });

  final bool isRow;
  final String text;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    final children = [
      Text(
        text,
        textAlign: TextAlign.center,
      ),
      IconButton(
        onPressed: onRefresh,
        icon: SvgPicture.asset(
          'assets/icons/reload.svg',
        ),
      ),
    ];

    return Container(
      width: double.infinity,
      padding:
          isRow ? const EdgeInsets.only(left: 14) : const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: surfaceContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: isRow
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: children,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
    );
  }
}
