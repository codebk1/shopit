import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';

part 'products_controller.g.dart';

const kProductsPageLimit = 10;

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
Future<List<Product>> productsPage(
  ProductsPageRef ref,
  PageMeta meta,
) async {
  Product? startAfter;

  if (meta.page > 1) {
    final prevPage = await ref.read(
      productsPageProvider(meta.copyWith(page: meta.page - 1)).future,
    );

    startAfter = prevPage.last;
  }

  return ref.read(productsRepositoryProvider).paginateByCategory(
        meta.itemId,
        startAfter: startAfter,
        limit: kProductsPageLimit,
        sort: ref.watch(productsSortProvider),
      );
}

@riverpod
class ProductsPageController extends _$ProductsPageController {
  @override
  int build() {
    return 1;
  }

  Future<void> nextPage(AsyncValue value) async {
    final canLoadMore = !value.isLoading &&
        !value.hasError &&
        value.asData!.value.isNotEmpty &&
        value.asData!.value.length == kProductsPageLimit;

    if (!canLoadMore) return;

    state = state + 1;
  }
}
