import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopit/src/constants/colors.dart';
import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/features/home/application/controllers/home_controller.dart';
import 'package:shopit/src/features/home/views/widgets/featured_empty_state.dart';

class FeaturedProductsFilters extends ConsumerWidget {
  const FeaturedProductsFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final featuredProductsCategories = ref.watch(
      featuredProductsCategoriesProvider,
    );

    final featuredProductsFilter = ref.watch(featuredProductsFilterProvider);

    return SizedBox(
      height: 40,
      child: featuredProductsCategories.when(
        skipLoadingOnRefresh: false,
        data: (categories) {
          final filters = [null, ...categories];

          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            separatorBuilder: (context, index) => gapW8,
            itemBuilder: (context, index) {
              return RawChip(
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 18),
                side: BorderSide.none,
                backgroundColor: featuredProductsFilter == filters[index]?.id
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).colorScheme.onPrimary,
                label: Text(filters[index]?.name ?? 'All'),
                onPressed: () => ref
                    .read(featuredProductsFilterProvider.notifier)
                    .set(filters[index]?.id),
              );
            },
          );
        },
        error: (_, __) => FeaturedEmptyState(
          isRow: true,
          text: 'Can\'t load filters. Try again later.',
          onRefresh: () => ref.invalidate(featuredProductsCategoriesProvider),
        ),
        loading: () => Shimmer.fromColors(
          baseColor: shimmerDarkBaseColor,
          highlightColor: shimmerDarkHighlightColor,
          child: SizedBox(
            height: 40,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => gapW8,
              itemBuilder: (context, index) {
                return Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
