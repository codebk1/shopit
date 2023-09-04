// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartItemHash() => r'b291ede23cccff4f5be2fd7c36b1edd8cdddb7bd';

/// See also [cartItem].
@ProviderFor(cartItem)
final cartItemProvider = AutoDisposeProvider<Item>.internal(
  cartItem,
  name: r'cartItemProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartItemHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef CartItemRef = AutoDisposeProviderRef<Item>;
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
String _$cartSubtotalHash() => r'8871585b831a6de080b5d3afd3d687b0963221d8';

/// See also [cartSubtotal].
@ProviderFor(cartSubtotal)
final cartSubtotalProvider = AutoDisposeFutureProvider<double>.internal(
  cartSubtotal,
  name: r'cartSubtotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartSubtotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartSubtotalRef = AutoDisposeFutureProviderRef<double>;
String _$cartControllerHash() => r'619a4a640b92bffc85e24a25ae8b1663d65a8cd1';

/// See also [CartController].
@ProviderFor(CartController)
final cartControllerProvider =
    AutoDisposeAsyncNotifierProvider<CartController, Cart>.internal(
  CartController.new,
  name: r'cartControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CartController = AutoDisposeAsyncNotifier<Cart>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
