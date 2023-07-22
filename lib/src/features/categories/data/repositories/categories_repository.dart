import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/categories/domain/entities/category.dart';
import 'package:shopit/src/features/categories/domain/datasources/categories_remote_datasource.dart';
import 'package:shopit/src/features/categories/data/datasources/categories_firestore_datasource.dart';

part 'categories_repository.g.dart';

class CategoriesRepository {
  const CategoriesRepository(this._remoteDataSource);

  final ICategoriesRemoteDataSource _remoteDataSource;

  Future<int> count() {
    return _remoteDataSource.count();
  }

  Future<List<Category>> paginate({
    String startAfter = '',
    int limit = 10,
  }) {
    return _remoteDataSource.paginate(startAfter, limit);
  }

  Future<List<Category>> featured() {
    return _remoteDataSource.featured();
  }

  Future<List<Category>> byIds(List<String> ids) {
    return _remoteDataSource.byIds(ids);
  }
}

@Riverpod(keepAlive: true)
CategoriesRepository categoriesRepository(CategoriesRepositoryRef ref) {
  final remoteDataSource = CategoriesFirestoreDataSource(
    FirebaseFirestore.instance,
  );

  return CategoriesRepository(remoteDataSource);
}
