import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductsHeader extends ConsumerWidget {
  const ProductsHeader({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsCount = ref.watch(productsCountProvider(categoryId));

    return productsCount.when(
      data: (count) => Container(
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
                  context.l10n.productsCount(count),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            PopupMenuButton(
              icon: const SvgIcon(iconName: 'funnel'),
              position: PopupMenuPosition.under,
              onSelected: (value) =>
                  ref.read(productsSortProvider.notifier).set(value),
              itemBuilder: (context) => [
                ProductsSortMenuItem(
                  value: const NameASC(),
                  label: context.l10n.sortNameASC,
                ),
                ProductsSortMenuItem(
                  value: const NameDESC(),
                  label: context.l10n.sortNameDESC,
                ),
                ProductsSortMenuItem(
                  value: const PriceASC(),
                  label: context.l10n.sortPriceASC,
                ),
                ProductsSortMenuItem(
                  value: const PriceDESC(),
                  label: context.l10n.sortPriceDESC,
                ),
              ],
            ),
          ],
        ),
      ),
      error: (_, __) => Text(context.l10n.productsCountLoadingError),
      loading: () => Shimmer.fromColors(
        // TODO: refactor when: https://github.com/flutter/flutter/issues/115912
        baseColor: shimmerDarkBaseColor(ref),
        highlightColor: shimmerDarkHighlightColor(ref),
        child: Container(
          height: 48,
          padding: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
