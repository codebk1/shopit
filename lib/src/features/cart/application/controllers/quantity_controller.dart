import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/cart/domain/entities/item.dart';
import 'package:shopit/src/features/cart/application/controllers/cart_controller.dart';

part 'quantity_controller.g.dart';

@riverpod
class QuantityController extends _$QuantityController {
  @override
  FutureOr<Item> build(Item item) {
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
