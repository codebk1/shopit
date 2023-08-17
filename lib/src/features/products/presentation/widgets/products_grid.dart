import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopit/src/l10n/l10n.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';

class ProductsGrid extends ConsumerWidget {
  const ProductsGrid({
    super.key,
    required this.categoryId,
  });

  final String categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(productsPageControllerProvider);
    final meta = PageMeta(itemId: categoryId, page: page);
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
                        text: context.l10n.productsEmptyState,
                        onRefresh: () => ref.invalidate(
                          productsPageProvider(meta.copyWith(page: 1)),
                        ),
                      )
                    : const SizedBox.shrink(),
                error: (_, __) => page == 1
                    ? ErrorState(
                        text: context.l10n.productsErrorState,
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
