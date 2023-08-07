import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/products/products.dart';
import 'package:shopit/src/features/cart/cart.dart';

part 'cart_controller.g.dart';

@riverpod
class CartController extends _$CartController {
  @override
  FutureOr<Cart> build() async {
    return ref.watch(cartServiceProvider).get();
  }

  Future<void> addItem(String itemId) async {
    final cart = state.value!;

    Item? currentItem;
    for (final item in cart.items) {
      if (item.id == itemId) {
        currentItem = item;
        break;
      }
    }

    if (currentItem == null) {
      state = await AsyncValue.guard(() async {
        final newCart = cart.copyWith(
          items: [...cart.items, Item(id: itemId, quantity: 1)],
        );

        await ref.read(cartServiceProvider).update(newCart);
        return newCart;
      });
    } else {
      await updateItem(currentItem, currentItem.quantity + 1);
    }
  }

  Future<void> updateItem(Item currentItem, int quantity) async {
    final cart = state.value!;

    List<Item> newItems;
    final index = cart.items.indexOf(currentItem);

    if (quantity == 0) {
      newItems = [...cart.items]..remove(currentItem);
    } else {
      newItems = [...cart.items]..replaceRange(
          index,
          index + 1,
          [currentItem.copyWith(quantity: quantity)],
        );
    }

    state = await AsyncValue.guard(() async {
      final newCart = cart.copyWith(items: newItems);
      await ref.read(cartServiceProvider).update(newCart);

      return newCart;
    });
  }

  Future<void> removeItem(Item item) async {
    state = await AsyncValue.guard(
      () async {
        final newCart = state.value!.copyWith(
          items: [...state.value!.items]..remove(item),
        );

        await ref.read(cartServiceProvider).update(newCart);

        return newCart;
      },
    );
  }

  Future<void> clearCart() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final cartService = ref.read(cartServiceProvider);

      await cartService.clear(state.value!);
      return cartService.get();
    });
  }
}

@Riverpod(dependencies: [])
Item cartItem(CartItemRef ref) {
  throw UnimplementedError();
}

@riverpod
int cartItemsCount(CartItemsCountRef ref) {
  return ref.watch(cartControllerProvider).maybeWhen(
        data: (cart) => cart.items.fold(0, (v, item) => v + item.quantity),
        orElse: () => 0,
      );
}

@riverpod
Future<double> cartSubtotal(CartSubtotalRef ref) async {
  final cart = ref.watch(cartControllerProvider).value;

  var total = 0.0;
  if (cart != null) {
    for (var item in cart.items) {
      final product = await ref.read(productProvider(item.id).future);

      total += product!.price * item.quantity;
    }
  }

  return total;
}
