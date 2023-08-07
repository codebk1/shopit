import 'package:shopit/src/features/cart/cart.dart';

abstract interface class ICartRemoteDataSource {
  Future<Cart> get(String id);
  Future<void> update(Cart cart);
  Future<void> clear(Cart cart);
}
