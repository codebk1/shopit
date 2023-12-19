// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

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
String _$checkoutItemsCountHash() =>
    r'3deabcb26722f4b53d29200e9a7972a3247f0b10';

/// See also [checkoutItemsCount].
@ProviderFor(checkoutItemsCount)
final checkoutItemsCountProvider = AutoDisposeProvider<int>.internal(
  checkoutItemsCount,
  name: r'checkoutItemsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkoutItemsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CheckoutItemsCountRef = AutoDisposeProviderRef<int>;
String _$checkoutAddressHash() => r'4d5bcec9b8a2266c0fd77530e52c4cdeb11c64ee';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [checkoutAddress].
@ProviderFor(checkoutAddress)
const checkoutAddressProvider = CheckoutAddressFamily();

/// See also [checkoutAddress].
class CheckoutAddressFamily extends Family<AsyncValue<Address?>> {
  /// See also [checkoutAddress].
  const CheckoutAddressFamily();

  /// See also [checkoutAddress].
  CheckoutAddressProvider call(
    String? selectedAddressId,
    AddressType type,
  ) {
    return CheckoutAddressProvider(
      selectedAddressId,
      type,
    );
  }

  @override
  CheckoutAddressProvider getProviderOverride(
    covariant CheckoutAddressProvider provider,
  ) {
    return call(
      provider.selectedAddressId,
      provider.type,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'checkoutAddressProvider';
}

/// See also [checkoutAddress].
class CheckoutAddressProvider extends AutoDisposeFutureProvider<Address?> {
  /// See also [checkoutAddress].
  CheckoutAddressProvider(
    String? selectedAddressId,
    AddressType type,
  ) : this._internal(
          (ref) => checkoutAddress(
            ref as CheckoutAddressRef,
            selectedAddressId,
            type,
          ),
          from: checkoutAddressProvider,
          name: r'checkoutAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkoutAddressHash,
          dependencies: CheckoutAddressFamily._dependencies,
          allTransitiveDependencies:
              CheckoutAddressFamily._allTransitiveDependencies,
          selectedAddressId: selectedAddressId,
          type: type,
        );

  CheckoutAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.selectedAddressId,
    required this.type,
  }) : super.internal();

  final String? selectedAddressId;
  final AddressType type;

  @override
  Override overrideWith(
    FutureOr<Address?> Function(CheckoutAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckoutAddressProvider._internal(
        (ref) => create(ref as CheckoutAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        selectedAddressId: selectedAddressId,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Address?> createElement() {
    return _CheckoutAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckoutAddressProvider &&
        other.selectedAddressId == selectedAddressId &&
        other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, selectedAddressId.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckoutAddressRef on AutoDisposeFutureProviderRef<Address?> {
  /// The parameter `selectedAddressId` of this provider.
  String? get selectedAddressId;

  /// The parameter `type` of this provider.
  AddressType get type;
}

class _CheckoutAddressProviderElement
    extends AutoDisposeFutureProviderElement<Address?> with CheckoutAddressRef {
  _CheckoutAddressProviderElement(super.provider);

  @override
  String? get selectedAddressId =>
      (origin as CheckoutAddressProvider).selectedAddressId;
  @override
  AddressType get type => (origin as CheckoutAddressProvider).type;
}

String _$checkoutControllerHash() =>
    r'bb2d5f7ca2626f2f09026a8ac7577a5795c4f43e';

/// See also [CheckoutController].
@ProviderFor(CheckoutController)
final checkoutControllerProvider =
    AsyncNotifierProvider<CheckoutController, Checkout>.internal(
  CheckoutController.new,
  name: r'checkoutControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$checkoutControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CheckoutController = AsyncNotifier<Checkout>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
