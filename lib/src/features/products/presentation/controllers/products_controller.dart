import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';

part 'products_controller.g.dart';

const kProductsPageLimit = 10;

@Riverpod(dependencies: [])
String productId(ProductIdRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<int> productsCount(ProductsCountRef ref, String id) {
  return ref.read(productsRepositoryProvider).countByCategory(id);
}

@riverpod
class ProductsSort extends _$ProductsSort {
  @override
  Sort build() {
    return const NameASC();
  }

  void set(Sort sort) {
    state = sort;
  }
}

@riverpod
class ProductsPageController extends _$ProductsPageController {
  @override
  FutureOr<PageMeta<Product>> build(String categoryId) async {
    final items = await ref.read(productsRepositoryProvider).paginateByCategory(
          categoryId,
          limit: kProductsPageLimit,
          sort: ref.watch(productsSortProvider),
        );

    return PageMeta(
      items: items,
    );
  }

  Future<void> nextPage() async {
    final pageMeta = state.requireValue;

    final canLoadMore = pageMeta.items.length % kProductsPageLimit == 0 &&
        !pageMeta.noMoreItems &&
        !pageMeta.isLoading;

    if (!canLoadMore) return;

    try {
      state = AsyncData(
        state.requireValue.copyWith(
          isLoading: true,
          error: null,
        ),
      );

      final nextItems =
          await ref.read(productsRepositoryProvider).paginateByCategory(
                categoryId,
                startAfter: pageMeta.items.last,
                limit: kProductsPageLimit,
                sort: ref.watch(productsSortProvider),
              );

      state = AsyncData(
        state.requireValue.copyWith(
          isLoading: false,
          noMoreItems: nextItems.isEmpty,
          items: [
            ...pageMeta.items,
            ...nextItems,
          ],
        ),
      );
    } catch (error) {
      state = AsyncData(
        state.requireValue.copyWith(
          isLoading: false,
          error: error,
        ),
      );
    }
  }
}
