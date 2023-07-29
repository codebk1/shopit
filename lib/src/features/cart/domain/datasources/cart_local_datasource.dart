import 'package:shopit/src/features/cart/domain/schemas/local_cart.dart';

abstract interface class ICartLocalDataSource {
  Future<LocalCart?> get();
  Future<void> update(LocalCart cart);
  Future<void> clear();
}
