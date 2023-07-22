import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/common/widgets/empty_state.dart';
import 'package:shopit/src/common/widgets/error_state.dart';
import 'package:shopit/src/features/products/application/controllers/products_controller.dart';
import 'package:shopit/src/features/products/presentation/widgets/load_more_loader.dart';
import 'package:shopit/src/features/products/presentation/widgets/load_more_error.dart';
import 'package:shopit/src/features/products/presentation/widgets/products_grid_loader.dart';
import 'package:shopit/src/features/products/presentation/widgets/products_grid_item.dart';

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(productsPageControllerProvider);
    final meta = ProductsPageMeta(categoryId: categoryId, page: page);
    final productsPage = ref.watch(productsPageProvider(meta));

    return NotificationListener<ScrollEndNotification>(
      onNotification: (scroll) {
        if (scroll.metrics.extentAfter < 150) {
          ref
              .read(productsPageControllerProvider.notifier)
              .nextPage(productsPage);
        }

        return true;
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: CustomScrollView(
          cacheExtent: 100,
          slivers: [
            for (var i = 1; i <= page; i++)
              ref.watch(productsPageProvider(meta.copyWith(page: i))).maybeWhen(
                    data: (products) => SliverPadding(
                      padding:
                          EdgeInsets.only(bottom: products.isEmpty ? 0 : 14),
                      sliver: SliverGrid.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: products.length,
                        itemBuilder: (_, index) {
                          return ProductsGridItem(
                            product: products[index],
                          );
                        },
                      ),
                    ),
                    orElse: () => const SliverToBoxAdapter(
                      child: SizedBox.shrink(),
                    ),
                  ),
            SliverToBoxAdapter(
              child: productsPage.when(
                skipLoadingOnRefresh: false,
                data: (products) => products.isEmpty
                    ? EmptyState(
                        text: 'Not found any products.\nTry again later.',
                        onRefresh: () => ref.invalidate(
                          productsPageProvider(meta.copyWith(page: 1)),
                        ),
                      )
                    : const SizedBox.shrink(),
                error: (_, __) => page == 1
                    ? ErrorState(
                        text: 'Can\'t load products.\nTry again later.',
                        onRefresh: () => ref.invalidate(
                          productsPageProvider(meta.copyWith(page: 1)),
                        ),
                      )
                    : LoadMoreError(
                        onRefresh: () => ref.invalidate(
                          productsPageProvider(meta.copyWith(page: page)),
                        ),
                      ),
                loading: () => page == 1
                    ? const ProductsGridLoader()
                    : const LoadMoreLoader(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
