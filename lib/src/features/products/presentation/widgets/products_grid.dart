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
    final productsPageProvider = productsPageControllerProvider(categoryId);
    final productsPageController = ref.watch(productsPageProvider);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: productsPageController.when(
        skipLoadingOnRefresh: false,
        data: (pageMeta) {
          return pageMeta.items.isEmpty
              ? EmptyState(
                  text: context.l10n.productsEmptyState,
                  onRefresh: () => ref.invalidate(productsPageProvider),
                )
              : NotificationListener<ScrollEndNotification>(
                  onNotification: (scroll) {
                    if (scroll.metrics.extentAfter < 150) {
                      ref.read(productsPageProvider.notifier).nextPage();
                    }

                    return true;
                  },
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(
                          bottom: pageMeta.items.isEmpty ? 0 : 14,
                        ),
                        sliver: SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: pageMeta.items.length,
                          itemBuilder: (_, index) {
                            return ProductsGridItem(
                              product: pageMeta.items[index],
                            );
                          },
                        ),
                      ),
                      if (pageMeta.isLoading)
                        const SliverToBoxAdapter(
                          child: LoadMoreLoader(),
                        ),
                      if (pageMeta.error != null)
                        SliverToBoxAdapter(
                          child: LoadMoreError(
                            onRefresh: () => ref
                                .read(productsPageProvider.notifier)
                                .nextPage(),
                          ),
                        ),
                    ],
                  ),
                );
        },
        error: (_, __) => ErrorState(
          text: context.l10n.productsErrorState,
          onRefresh: () => ref.invalidate(productsPageProvider),
        ),
        loading: () => const ProductsGridLoader(),
      ),
    );
  }
}
