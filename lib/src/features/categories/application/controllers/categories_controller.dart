import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/categories/categories.dart';

part 'categories_controller.g.dart';

const kCategoriesPageLimit = 10;

@riverpod
Future<int> categoriesCount(CategoriesCountRef ref) async {
  return ref.watch(categoriesRepositoryProvider).count();
}

@riverpod
Future<List<Category>> categoriesPage(
  CategoriesPageRef ref,
  int page,
) async {
  String startAfter = page > 0
      ? (await ref.read(categoriesPageProvider(page - 1).future)).last.name
      : '';

  final categories = await ref.read(categoriesRepositoryProvider).paginate(
        startAfter: startAfter,
        limit: kCategoriesPageLimit,
      );

  // cache provider only when we have categories page
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 60), () => link.close());
  ref.onDispose(() => timer.cancel());

  return categories;
}

@riverpod
AsyncValue<Category> category(
  CategoryRef ref,
  int index,
) {
  final indexInPage = index % kCategoriesPageLimit;
  final page = index ~/ kCategoriesPageLimit;

  return ref.watch(categoriesPageProvider(page)).whenData(
        (value) => value[indexInPage],
      );
}
