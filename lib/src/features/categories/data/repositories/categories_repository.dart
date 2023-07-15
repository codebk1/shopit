import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/categories/domain/entities/category.dart';
import 'package:shopit/src/features/categories/domain/datasources/categories_remote_datasource.dart';
import 'package:shopit/src/features/categories/data/datasources/categories_firestore_datasource.dart';

part 'categories_repository.g.dart';

class CategoriesRepository {
  const CategoriesRepository(this._remoteDataSource);

  final ICategoriesRemoteDataSource _remoteDataSource;

  Future<int> getCategoriesCount() {
    return _remoteDataSource.getCategoriesCount();
  }

  Future<List<Category>> getCategories({
    String startAfter = '',
    int limit = 10,
  }) {
    return _remoteDataSource.getCategories(startAfter, limit);
  }
}

@Riverpod(keepAlive: true)
CategoriesRepository categoriesRepository(CategoriesRepositoryRef ref) {
  final remoteDataSource = CategoriesFirestoreDataSource(
    FirebaseFirestore.instance,
  );

  return CategoriesRepository(remoteDataSource);
}
