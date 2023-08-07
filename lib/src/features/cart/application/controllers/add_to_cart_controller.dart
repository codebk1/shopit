import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/cart/cart.dart';

part 'add_to_cart_controller.g.dart';

@riverpod
class AddToCartController extends _$AddToCartController {
  @override
  FutureOr<void> build() {}

  Future<void> addItem(String productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(cartControllerProvider.notifier).addItem(productId),
    );
  }
}
