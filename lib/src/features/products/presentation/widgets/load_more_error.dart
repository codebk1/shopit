import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/constants/colors.dart';

class LoadMoreError extends StatelessWidget {
  const LoadMoreError({
    super.key,
    required this.onRefresh,
  });

  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.only(left: 14),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: surfaceContainer,
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Can\'t load more products, try again later.',
            ),
          ),
          IconButton(
            onPressed: onRefresh,
            icon: SvgPicture.asset(
              'assets/icons/reload.svg',
            ),
          ),
        ],
      ),
    );
  }
}
