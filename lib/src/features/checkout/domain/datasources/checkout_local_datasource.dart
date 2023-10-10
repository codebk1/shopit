import 'package:shopit/src/features/checkout/checkout.dart';

abstract interface class ICheckoutLocalDataSource {
  Future<Checkout?> get();
  Future<void> update(Checkout checkout);
  Future<void> clear();
}
