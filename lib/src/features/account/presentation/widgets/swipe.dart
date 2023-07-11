import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/spacing.dart';

class Swipe extends StatelessWidget {
  const Swipe({
    super.key,
    required this.text,
    required this.iconPath,
    required this.color,
    required this.backgroundColor,
    required this.rowAlignment,
  });

  final String text;
  final String iconPath;
  final Color color;
  final Color backgroundColor;
  final MainAxisAlignment rowAlignment;

  @override
  Widget build(BuildContext context) {
    final items = [
      SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      ),
      gapW4,
      Text(
        text,
        style: TextStyle(color: color),
      ),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: rowAlignment,
        children: rowAlignment == MainAxisAlignment.start
            ? items
            : items.reversed.toList(),
      ),
    );
  }
}
