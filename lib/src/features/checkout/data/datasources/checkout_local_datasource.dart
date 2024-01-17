import 'package:drift/drift.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class CheckoutLocalDataSource implements ICheckoutLocalDataSource {
  CheckoutLocalDataSource(this._db);

  final AppDatabase _db;

  @override
  Future<Checkout?> get() async {
    final checkout = await _db.checkouts.select().getSingleOrNull();

    if (checkout != null) {
      final cartItems = await _db.cartItems.select().get();

      return checkout.copyWith(
        items: cartItems,
      );
    }

    return checkout;
  }

  @override
  Future<void> update(Checkout checkout) async {
    final checkoutId = await _db.checkouts.insertOne(
      checkout,
      mode: InsertMode.insertOrReplace,
    );

    return _db.cartItems.insertAll(
      checkout.items.map(
        (item) => CartItemsCompanion.insert(
          checkout: checkoutId,
          id: item.id,
          price: item.price,
          quantity: item.quantity,
        ),
      ),
    );
  }

  @override
  Future<void> clear() {
    return _db.checkouts.deleteAll();
  }
}
