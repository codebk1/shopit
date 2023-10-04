// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartItemHash() => r'4ac972facf8740e6fddef6a1b5bfb81eeaa49dbb';

/// See also [cartItem].
@ProviderFor(cartItem)
final cartItemProvider = AutoDisposeProvider<CartItem>.internal(
  cartItem,
  name: r'cartItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartItemHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef CartItemRef = AutoDisposeProviderRef<CartItem>;
String _$cartItemsCountHash() => r'e8ac312dcbb87c1d8fe633856b3683b253c6d6ab';

/// See also [cartItemsCount].
@ProviderFor(cartItemsCount)
final cartItemsCountProvider = AutoDisposeProvider<int>.internal(
  cartItemsCount,
  name: r'cartItemsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartItemsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartItemsCountRef = AutoDisposeProviderRef<int>;
String _$cartTotalHash() => r'738483e7dfe9b29067744624273eb0f75b866dcb';

/// See also [cartTotal].
@ProviderFor(cartTotal)
final cartTotalProvider = FutureProvider<double>.internal(
  cartTotal,
  name: r'cartTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartTotalRef = FutureProviderRef<double>;
String _$cartControllerHash() => r'd3e65a9e099180087723ccaf62d19f1d461b3ae8';

/// See also [CartController].
@ProviderFor(CartController)
final cartControllerProvider =
    AsyncNotifierProvider<CartController, Cart>.internal(
  CartController.new,
  name: r'cartControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartController = AsyncNotifier<Cart>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
