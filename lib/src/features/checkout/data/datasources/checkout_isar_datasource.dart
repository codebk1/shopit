import 'package:isar/isar.dart';

import 'package:shopit/src/features/features.dart';

class CheckoutIsarDataSource implements ICheckoutLocalDataSource {
  CheckoutIsarDataSource(this._isar);

  final Isar _isar;

  @override
  Future<Checkout?> get() {
    return _isar.checkouts.getAsync('1');
  }

  @override
  Future<void> update(Checkout checkout) {
    return _isar.writeAsync(
      (isar) => isar.checkouts.put(checkout),
    );
  }

  @override
  Future<void> clear() {
    return _isar.writeAsync(
      (isar) => isar.checkouts.clear(),
    );
  }
}
