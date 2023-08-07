import 'package:shopit/src/features/cart/cart.dart';

abstract interface class ICartLocalDataSource {
  Future<LocalCart?> get();
  Future<void> update(LocalCart cart);
  Future<void> clear();
}
