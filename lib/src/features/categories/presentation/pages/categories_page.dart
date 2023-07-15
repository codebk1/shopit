import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/constants/spacing.dart';
import 'package:shopit/src/common/widgets/loader.dart';
import 'package:shopit/src/common/widgets/main_app_bar.dart';
import 'package:shopit/src/common/widgets/error_state.dart';
import 'package:shopit/src/features/categories/application/controllers/categories_controller.dart';
import 'package:shopit/src/features/categories/presentation/widgets/categories_grid_item.dart';
import 'package:shopit/src/features/categories/presentation/widgets/categories_header.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: 'Categories',
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
                    child: RefreshIndicator(
                      onRefresh: () => ref.refresh(
                        categoriesCountProvider.future,
                      ),
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
                          itemCount: count,
                          itemBuilder: (context, index) {
                            return CategoriesGridItem(index: index);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            error: (error, stackTrace) => ErrorState(
              text: error.toString(),
              onRefresh: () => ref.refresh(categoriesCountProvider.future),
            ),
            loading: () => const Loader(dark: true),
          );
        },
      ),
    );
  }
}
