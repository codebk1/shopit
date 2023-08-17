import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/cart/cart.dart';

part 'cart_remote_repository.g.dart';

class CartRemoteRepository {
  CartRemoteRepository(this._remoteDataSource);

  final ICartRemoteDataSource _remoteDataSource;

  Future<Cart> get(String id) {
    return _remoteDataSource.get(id);
  }

  Future<void> update(Cart cart) {
    return _remoteDataSource.update(cart);
  }

  Future<void> clear(Cart cart) {
    return _remoteDataSource.clear(cart);
  }
}

@Riverpod(keepAlive: true)
CartRemoteRepository cartRemoteRepository(CartRemoteRepositoryRef ref) {
  final remoteDataSource = CartFirebaseDataSource(FirebaseFirestore.instance);

  return CartRemoteRepository(remoteDataSource);
}
