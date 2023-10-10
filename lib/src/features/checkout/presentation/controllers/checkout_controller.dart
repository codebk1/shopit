import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/addresses/addresses.dart';
import 'package:shopit/src/features/carriers/carriers.dart';
import 'package:shopit/src/features/payments/payments.dart';
import 'package:shopit/src/features/checkout/checkout.dart';

part 'checkout_controller.g.dart';

@Riverpod(keepAlive: true)
class CheckoutController extends _$CheckoutController {
  @override
  FutureOr<Checkout> build() {
    return ref.watch(checkoutServiceProvider).get();
  }

  Future<void> setStep(int step) async {
    final checkout = await future;

    state = await AsyncValue.guard(() async {
      final newCheckout = checkout.copyWith(
        currentStep: step,
      );

      await ref.read(checkoutServiceProvider).update(newCheckout);

      return newCheckout;
    });
  }

  Future<void> setCarrier(Carrier carrier) async {
    final checkout = await future;

    state = AsyncData(checkout.copyWith(
      carrierId: carrier.id,
    ));
  }

  Future<void> setPayment(Payment payment) async {
    final checkout = await future;

    state = AsyncData(checkout.copyWith(
      paymentId: payment.id,
    ));
  }

  Future<void> setAddress(Address address) async {
    final checkout = await future;

    state = AsyncData(address.type == AddressType.delivery
        ? checkout.copyWith(deliveryAddressId: address.id)
        : checkout.copyWith(paymentAddressId: address.id));
  }

  Future<void> addItem(CartItem item) async {
    final checkout = await future;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final index = checkout.items.indexWhere((el) => el.id == item.id);

      final newCheckout = checkout.copyWith(
        items: index == -1
            ? [...checkout.items, item]
            : ([...checkout.items]..replaceRange(index, index + 1, [
                checkout.items[index].copyWith(
                  quantity: checkout.items[index].quantity + 1,
                )
              ])),
      );

      await ref.read(checkoutServiceProvider).update(newCheckout);

      return newCheckout;
    });
  }

  Future<void> removeItem(CartItem item) async {
    final checkout = await future;

    state = await AsyncValue.guard(
      () async {
        final index = checkout.items.indexWhere((el) => el.id == item.id);

        final newCheckout = checkout.copyWith(
          items: checkout.items[index].quantity == 1
              ? ([...checkout.items]..remove(item))
              : ([...checkout.items]..replaceRange(index, index + 1, [
                  checkout.items[index].copyWith(
                    quantity: checkout.items[index].quantity - 1,
                  )
                ])),
        );

        await ref.read(checkoutServiceProvider).update(newCheckout);

        return newCheckout;
      },
    );
  }

  Future<void> clearItems() async {
    state = await AsyncValue.guard(() async {
      await ref.read(checkoutServiceProvider).clear();

      return const Checkout();
    });
  }
}

@Riverpod(dependencies: [])
CartItem cartItem(CartItemRef ref) {
  throw UnimplementedError();
}

@riverpod
int checkoutItemsCount(CheckoutItemsCountRef ref) {
  return ref.watch(checkoutControllerProvider).maybeWhen(
        skipLoadingOnReload: true,
        data: (checkout) =>
            checkout.items.fold(0, (prev, item) => prev + item.quantity),
        orElse: () => 0,
      );
}

@riverpod
Future<Address?> checkoutAddress(
  CheckoutAddressRef ref,
  String? selectedAddressId,
  AddressType type,
) {
  return selectedAddressId != null
      ? ref.watch(addressProvider(selectedAddressId, type).future)
      : ref.watch(defaultAddressProvider(type).future);
}
