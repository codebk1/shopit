import 'package:shopit/src/features/cart/domain/schemas/local_cart.dart';

abstract class ICartLocalDataSource {
  Future<LocalCart> get();
  Future<void> update(LocalCart cart);
  Future<void> clear();
}
