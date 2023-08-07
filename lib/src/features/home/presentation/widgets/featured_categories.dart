import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/constants/constants.dart';
import 'package:shopit/src/features/home/home.dart';

class FeaturedCategories extends StatelessWidget {
  const FeaturedCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(
            context.l10n.homeFeaturedCategoriesHeader,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        gapH10,
        SizedBox(
          height: 120,
          child: Consumer(
            builder: (context, ref, child) {
              final featuredCategories = ref.watch(featuredCategoriesProvider);

              return featuredCategories.when(
                skipLoadingOnRefresh: false,
                data: (categories) => categories.isEmpty
                    ? FeaturedEmptyState(
                        text: context.l10n.homeFeaturedCategoriesEmptyStateText,
                        onRefresh: () => ref.invalidate(
                          featuredCategoriesProvider,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        separatorBuilder: (_, __) => gapW8,
                        itemBuilder: (_, index) {
                          return FeaturedCategoriesItem(
                            category: categories[index],
                          );
                        },
                      ),
                error: (_, __) => FeaturedEmptyState(
                  text: context.l10n.homeFeaturedCategoriesEmptyStateText,
                  onRefresh: () => ref.invalidate(featuredCategoriesProvider),
                ),
                loading: () => const FeaturedCategoriesLoader(),
              );
            },
          ),
        ),
      ],
    );
  }
}
