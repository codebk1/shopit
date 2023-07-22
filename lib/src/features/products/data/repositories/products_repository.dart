import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/products/domain/datasources/products_remote_datasource.dart';
import 'package:shopit/src/features/products/data/datasources/products_firestore_datasource.dart';

part 'products_repository.g.dart';

class ProductsRepository {
  const ProductsRepository(this._remoteDataSource);

  final IProductsRemoteDataSource _remoteDataSource;

  Future<Product?> getById(String id) {
    return _remoteDataSource.getById(id);
  }

  Future<int> countByCategory(String id) {
    return _remoteDataSource.countByCategoryId(id);
  }

  Future<List<Product>> paginateByCategory(
    String id, {
    String startAfter = '',
    int limit = 10,
  }) {
    return _remoteDataSource.paginateByCategory(id, startAfter, limit);
  }

  Future<List<Product>> featured() {
    return _remoteDataSource.featured();
  }
}

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(ProductsRepositoryRef ref) {
  final remoteDataSource = ProductsFirestoreDataSource(
    FirebaseFirestore.instance,
  );

  return ProductsRepository(remoteDataSource);
}
