import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/cart/domain/entities/cart.dart';
import 'package:shopit/src/features/cart/domain/datasources/cart_remote_datasource.dart';
import 'package:shopit/src/features/cart/data/datasources/cart_firestore_datasource.dart';

part 'cart_remote_repository.g.dart';

class CartRemoteRepository {
  CartRemoteRepository(this._remoteDataSource);

  final ICartRemoteDataSource _remoteDataSource;

  Future<Cart> get(String id) async {
    return _remoteDataSource.get(id);
  }

  Future<void> update(Cart cart) async {
    return _remoteDataSource.update(cart);
  }

  Future<void> clear(Cart cart) async {
    return _remoteDataSource.clear(cart);
  }
}

@Riverpod(keepAlive: true)
CartRemoteRepository cartRemoteRepository(CartRemoteRepositoryRef ref) {
  final remoteDataSource = CartFirestoreDataSource(FirebaseFirestore.instance);

  return CartRemoteRepository(remoteDataSource);
}
