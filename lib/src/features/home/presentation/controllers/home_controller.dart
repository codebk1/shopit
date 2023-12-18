import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'home_controller.g.dart';

@riverpod
Future<List<Category>> featuredCategories(FeaturedCategoriesRef ref) async {
  return ref.read(categoriesRepositoryProvider).featured();
}

@riverpod
Future<List<Product>> featuredProducts(FeaturedProductsRef ref) async {
  return await ref.read(productsRepositoryProvider).featured();
}

@riverpod
Future<List<Product>> filteredFeaturedProducts(
  FilteredFeaturedProductsRef ref,
) async {
  final featuredProducts = await ref.read(featuredProductsProvider.future);
  final featuredProductsFilter = ref.watch(featuredProductsFilterProvider);

  return featuredProductsFilter == null
      ? featuredProducts
      : featuredProducts
          .where((product) => product.categoryId == featuredProductsFilter)
          .toList();
}

@riverpod
Future<List<Category>> featuredProductsCategories(
  FeaturedProductsCategoriesRef ref,
) async {
  final featuredProducts = await ref.read(featuredProductsProvider.future);
  final uniqueIds = featuredProducts.map((p) => p.categoryId).toSet().toList();

  return ref.read(categoriesRepositoryProvider).byIds(uniqueIds);
}

@riverpod
class FeaturedProductsFilter extends _$FeaturedProductsFilter {
  @override
  String? build() {
    return null;
  }

  void set(String? filter) {
    state = filter;
  }
}
