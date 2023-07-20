import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/features/home/application/controllers/home_controller.dart';
import 'package:shopit/src/features/home/views/widgets/featured_empty_state.dart';
import 'package:shopit/src/features/home/views/widgets/featured_categories_loader.dart';
import 'package:shopit/src/features/home/views/widgets/featured_categories_item.dart';

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
            'Featured categories',
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
                        text:
                            'Not found any featured categories.\nTry again later.',
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
                  text: 'Can\'t load featured categories.\nTry again later.',
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
