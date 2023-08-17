import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/categories/categories.dart';

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
