import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';

class CategoriesHeader extends StatelessWidget {
  const CategoriesHeader({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: surfaceContainer,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '$count',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              gapW2,
              Text(
                context.l10n.categoriesCount(count),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/az.svg',
            ),
          )
        ],
      ),
    );
  }
}
