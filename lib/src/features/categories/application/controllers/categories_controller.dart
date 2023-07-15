import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/categories/domain/entities/category.dart';
import 'package:shopit/src/features/categories/data/repositories/categories_repository.dart';

part 'categories_controller.g.dart';

const kCategoriesPageLimit = 10;

@riverpod
Future<int> categoriesCount(CategoriesCountRef ref) async {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);

  return categoriesRepository.getCategoriesCount();
}

@riverpod
Future<List<Category>> categoriesPages(
  CategoriesPagesRef ref,
  int page,
) async {
  final categoriesRepository = ref.watch(categoriesRepositoryProvider);

  String startAfter = page > 0
      ? (await ref.read(categoriesPagesProvider(page - 1).future)).last.name
      : '';

  return categoriesRepository.getCategories(
    startAfter: startAfter,
    limit: kCategoriesPageLimit,
  );
}

@riverpod
AsyncValue<Category> category(
  CategoryRef ref,
  int index,
) {
  final indexInPage = index % kCategoriesPageLimit;
  final page = index ~/ kCategoriesPageLimit;

  return ref.watch(categoriesPagesProvider(page)).whenData(
        (value) => value[indexInPage],
      );
}
