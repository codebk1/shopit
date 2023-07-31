import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/svg_icon.dart';

class CategoriesHeader extends ConsumerWidget {
  const CategoriesHeader({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
        color: surfaceContainer(ref),
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
            icon: const SvgIcon(iconName: 'az'),
          )
        ],
      ),
    );
  }
}
