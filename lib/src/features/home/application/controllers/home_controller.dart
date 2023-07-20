import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/categories/domain/entities/category.dart';
import 'package:shopit/src/features/categories/data/repositories/categories_repository.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/products/data/repositories/products_repository.dart';

part 'home_controller.g.dart';

@riverpod
Future<List<Category>> featuredCategories(FeaturedCategoriesRef ref) async {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);

  return categoriesRepository.featured();
}

@riverpod
Future<List<Product>> featuredProducts(FeaturedProductsRef ref) async {
  final productsRepository = ref.watch(productsRepositoryProvider);

  return await productsRepository.featured();
}

@riverpod
Future<List<Product>> filteredFeaturedProducts(
  FilteredFeaturedProductsRef ref,
) async {
  final featuredProducts = await ref.watch(featuredProductsProvider.future);
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
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);
  final featuredProducts = await ref.watch(featuredProductsProvider.future);

  final uniqueIds = featuredProducts.map((p) => p.categoryId).toSet().toList();

  return categoriesRepository.byIds(uniqueIds);
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
