import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/utils/utils.dart';
import 'package:shopit/src/features/cart/cart.dart';

part 'cart_repository.g.dart';

class CartRepository {
  CartRepository(
    this._localDataSource,
  );

  final ICartLocalDataSource _localDataSource;

  Future<Cart> get() async {
    final localCart = await _localDataSource.get() ?? LocalCart();
    return localCart.toCart();
  }

  Future<void> update(Cart cart) {
    return _localDataSource.update(cart.toLocalCart());
  }

  Future<void> clear() {
    return _localDataSource.clear();
  }
}

@Riverpod(keepAlive: true)
CartRepository cartRepository(CartRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  final localDataSource = CartIsarDataSource(isar);

  return CartRepository(localDataSource);
}
