import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/features/home/application/controllers/home_controller.dart';
import 'package:shopit/src/features/home/views/widgets/featured_empty_state.dart';
import 'package:shopit/src/features/home/views/widgets/featured_products_filters.dart';
import 'package:shopit/src/features/home/views/widgets/featured_products_item.dart';
import 'package:shopit/src/features/home/views/widgets/featured_products_loader.dart';

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            context.l10n.homeFeaturedProductsHeader,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        gapH10,
        const FeaturedProductsFilters(),
        gapH10,
        Consumer(
          builder: (context, ref, child) {
            final featuredProducts = ref.watch(
              filteredFeaturedProductsProvider,
            );

            return SizedBox(
              height: 200,
              child: featuredProducts.when(
                skipLoadingOnReload: true,
                skipLoadingOnRefresh: false,
                data: (products) => ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  separatorBuilder: (_, __) => gapW8,
                  itemBuilder: (_, index) {
                    return FeaturedProductsItem(
                      product: products[index],
                    );
                  },
                ),
                error: (_, __) => FeaturedEmptyState(
                  text: context.l10n.homeFeaturedProductsEmptyState,
                  onRefresh: () => ref.invalidate(
                    filteredFeaturedProductsProvider,
                  ),
                ),
                loading: () => const FeaturedProductsLoader(),
              ),
            );
          },
        ),
      ],
    );
  }
}
