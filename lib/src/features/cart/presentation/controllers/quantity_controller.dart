import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/cart/cart.dart';

part 'quantity_controller.g.dart';

@riverpod
class QuantityController extends _$QuantityController {
  @override
  FutureOr<CartItem> build(CartItem item) {
    return item;
  }

  Future<void> changeQuantity(int quantity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(cartControllerProvider.notifier).updateItem(
            item,
            quantity,
          );

      return item.copyWith(quantity: quantity);
    });
  }
}
