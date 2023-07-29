import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/utils/isar.dart';
import 'package:shopit/src/features/cart/domain/entities/cart.dart';
import 'package:shopit/src/features/cart/domain/schemas/local_cart.dart';
import 'package:shopit/src/features/cart/domain/datasources/cart_local_datasource.dart';
import 'package:shopit/src/features/cart/data/datasources/cart_isar_datasource.dart';

part 'cart_local_repository.g.dart';

class CartLocalRepository {
  CartLocalRepository(this._localDataSource);

  final ICartLocalDataSource _localDataSource;

  Future<Cart> get() async {
    final localCart = await _localDataSource.get() ?? LocalCart();
    return localCart.toCart();
  }

  Future<void> update(Cart cart) async {
    return _localDataSource.update(cart.toLocalCart());
  }

  Future<void> clear() async {
    return _localDataSource.clear();
  }
}

@Riverpod(keepAlive: true)
CartLocalRepository cartLocalRepository(CartLocalRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  final localDataSource = CartIsarDataSource(isar);

  return CartLocalRepository(localDataSource);
}
