import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/svg_icon.dart';
import 'package:shopit/src/features/products/application/controllers/products_controller.dart';

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
                  context.l10n.productsCount(count),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const SvgIcon(iconName: 'funnel'),
            )
          ],
        ),
      ),
      error: (_, __) => Text(context.l10n.productsCountLoadingError),
      loading: () => Shimmer.fromColors(
        baseColor: shimmerDarkBaseColor,
        highlightColor: shimmerDarkHighlightColor,
        child: Container(
          height: 48,
          padding: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
