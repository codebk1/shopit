import 'package:isar/isar.dart';

import 'package:shopit/src/features/cart/cart.dart';

class CartIsarDataSource implements ICartLocalDataSource {
  CartIsarDataSource(this._isar);

  final Isar _isar;

  @override
  Future<LocalCart?> get() {
    return _isar.localCarts.get(1);
  }

  @override
  Future<void> update(LocalCart cart) {
    return _isar.writeTxn(() => _isar.localCarts.put(cart));
  }

  @override
  Future<void> clear() {
    return _isar.writeTxn(() => _isar.localCarts.clear());
  }
}
