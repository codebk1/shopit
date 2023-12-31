import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

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
        FeaturedProductsFilters(),
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
