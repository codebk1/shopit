import 'package:isar/isar.dart';

import 'package:shopit/src/features/cart/domain/schemas/local_cart.dart';
import 'package:shopit/src/features/cart/domain/datasources/cart_local_datasource.dart';

class CartIsarDataSource implements ICartLocalDataSource {
  CartIsarDataSource(this._isar);

  final Isar _isar;

  @override
  Future<LocalCart> get() async {
    return await _isar.localCarts.get(1) ?? LocalCart();
  }

  @override
  Future<void> update(LocalCart cart) async {
    return _isar.writeTxn(() => _isar.localCarts.put(cart));
  }

  @override
  Future<void> clear() async {
    return _isar.writeTxn(() => _isar.localCarts.clear());
  }
}
