import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/categories/categories.dart';

part 'categories_controller.g.dart';

const kCategoriesPageLimit = 10;

@riverpod
Future<int> categoriesCount(CategoriesCountRef ref) async {
  return ref.watch(categoriesRepositoryProvider).count();
}

@riverpod
class CategoriesSort extends _$CategoriesSort {
  @override
  Sort build() {
    return const NameASC();
  }

  void set(Sort sort) {
    state = sort;
  }
}

@riverpod
Future<List<Category>> categoriesPage(
  CategoriesPageRef ref,
  int page,
) async {
  Timer? timer;

  ref.onResume(() => timer?.cancel());
  ref.onDispose(() => timer?.cancel());

  String startAfter = page > 0
      ? (await ref.read(categoriesPageProvider(page - 1).future)).last.name
      : '';

  final categories = await ref.read(categoriesRepositoryProvider).paginate(
        startAfter: startAfter,
        limit: kCategoriesPageLimit,
        sort: ref.watch(categoriesSortProvider),
      );

  // cache provider only when we have categories page
  final link = ref.keepAlive();
  ref.onCancel(() => timer = Timer(const Duration(seconds: 60), link.close));

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
