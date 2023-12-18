import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

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
    Product? startAfter,
    int limit = 10,
    Sort sort = const NameASC(),
  }) {
    return _remoteDataSource.paginateByCategory(id, startAfter, limit, sort);
  }

  Future<List<Product>> featured() {
    return _remoteDataSource.featured();
  }
}

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(ProductsRepositoryRef ref) {
  final remoteDataSource = ProductsFirebaseDataSource(
    FirebaseFirestore.instance,
  );

  // final remoteDataSource = ProductsSupabaseDataSource(
  //   supabase.Supabase.instance.client,
  // );

  return ProductsRepository(remoteDataSource);
}

@riverpod
Future<Product?> product(ProductRef ref, String id) async {
  Timer? timer;

  ref.onResume(() => timer?.cancel());
  ref.onDispose(() => timer?.cancel());

  final product = await ref.read(productsRepositoryProvider).getById(id);

  // cache provider only when we have product
  final link = ref.keepAlive();
  ref.onCancel(() => timer = Timer(const Duration(seconds: 60), link.close));

  return product;
}
