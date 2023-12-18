import 'package:shopit/src/features/features.dart';

abstract interface class ICheckoutLocalDataSource {
  Future<Checkout?> get();
  Future<void> update(Checkout checkout);
  Future<void> clear();
}
