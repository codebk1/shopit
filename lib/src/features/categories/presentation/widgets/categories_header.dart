import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

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
        color: Theme.of(context).colorScheme.surfaceContainer,
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
          Consumer(
            builder: (context, ref, child) {
              final sort = ref.watch(categoriesSortProvider);

              return IconButton(
                onPressed: () => ref
                    .read(categoriesSortProvider.notifier)
                    .set(sort.descending ? const NameASC() : const NameDESC()),
                icon: SvgIcon(
                  iconName: sort.descending ? 'za' : 'az',
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
