import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: context.l10n.categoriesAppBarTitle,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final categoriesCount = ref.watch(categoriesCountProvider);

          return categoriesCount.when(
            data: (count) => Padding(
              padding: const EdgeInsets.only(
                top: 14,
                left: 14,
                right: 14,
              ),
              child: Column(
                children: [
                  CategoriesHeader(count: count),
                  gapH14,
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 14),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        cacheExtent: 1500,
                        itemCount: count,
                        itemBuilder: (context, index) {
                          return CategoriesGridItem(index: index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            error: (_, __) => ErrorState(
              text: context.l10n.categoriesErrorState,
              onRefresh: () => ref.invalidate(categoriesCountProvider),
            ),
            loading: () => const CategoriesGridLoader(),
          );
        },
      ),
    );
  }
}
