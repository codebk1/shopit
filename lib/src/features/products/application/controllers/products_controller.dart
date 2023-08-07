import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/products/products.dart';

part 'products_controller.freezed.dart';
part 'products_controller.g.dart';

const kProductsPageLimit = 10;

@freezed
class ProductsPageMeta with _$ProductsPageMeta {
  factory ProductsPageMeta({
    required String categoryId,
    required int page,
  }) = _ProductsPageMeta;
}

@Riverpod(dependencies: [])
String productId(ProductIdRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<Product?> product(ProductRef ref, String id) async {
  final product = await ref.read(productsRepositoryProvider).getById(id);

  // cache provider only when we have product
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 60), () => link.close());
  ref.onDispose(() => timer.cancel());

  return product;
}

@riverpod
Future<int> productsCount(ProductsCountRef ref, String id) async {
  return ref.read(productsRepositoryProvider).countByCategory(id);
}

@riverpod
Future<List<Product>> productsPage(
  ProductsPageRef ref,
  ProductsPageMeta meta,
) async {
  var startAfter = '';

  if (meta.page > 1) {
    final prevPage = await ref.read(
      productsPageProvider(meta.copyWith(page: meta.page - 1)).future,
    );

    startAfter = prevPage.last.name;
  }

  return ref.read(productsRepositoryProvider).paginateByCategory(
        meta.categoryId,
        startAfter: startAfter,
        limit: kProductsPageLimit,
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
