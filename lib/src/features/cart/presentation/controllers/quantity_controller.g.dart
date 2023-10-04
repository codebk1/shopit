// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quantityControllerHash() =>
    r'4f7a122009ff834f2666f081b7b52f564125bf68';

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

abstract class _$QuantityController
    extends BuildlessAutoDisposeAsyncNotifier<CartItem> {
  late final CartItem item;

  FutureOr<CartItem> build(
    CartItem item,
  );
}

/// See also [QuantityController].
@ProviderFor(QuantityController)
const quantityControllerProvider = QuantityControllerFamily();

/// See also [QuantityController].
class QuantityControllerFamily extends Family<AsyncValue<CartItem>> {
  /// See also [QuantityController].
  const QuantityControllerFamily();

  /// See also [QuantityController].
  QuantityControllerProvider call(
    CartItem item,
  ) {
    return QuantityControllerProvider(
      item,
    );
  }

  @override
  QuantityControllerProvider getProviderOverride(
    covariant QuantityControllerProvider provider,
  ) {
    return call(
      provider.item,
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
  String? get name => r'quantityControllerProvider';
}

/// See also [QuantityController].
class QuantityControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<QuantityController, CartItem> {
  /// See also [QuantityController].
  QuantityControllerProvider(
    CartItem item,
  ) : this._internal(
          () => QuantityController()..item = item,
          from: quantityControllerProvider,
          name: r'quantityControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$quantityControllerHash,
          dependencies: QuantityControllerFamily._dependencies,
          allTransitiveDependencies:
              QuantityControllerFamily._allTransitiveDependencies,
          item: item,
        );

  QuantityControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.item,
  }) : super.internal();

  final CartItem item;

  @override
  FutureOr<CartItem> runNotifierBuild(
    covariant QuantityController notifier,
  ) {
    return notifier.build(
      item,
    );
  }

  @override
  Override overrideWith(QuantityController Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuantityControllerProvider._internal(
        () => create()..item = item,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        item: item,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<QuantityController, CartItem>
      createElement() {
    return _QuantityControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuantityControllerProvider && other.item == item;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, item.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QuantityControllerRef on AutoDisposeAsyncNotifierProviderRef<CartItem> {
  /// The parameter `item` of this provider.
  CartItem get item;
}

class _QuantityControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<QuantityController,
        CartItem> with QuantityControllerRef {
  _QuantityControllerProviderElement(super.provider);

  @override
  CartItem get item => (origin as QuantityControllerProvider).item;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
