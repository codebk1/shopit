// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ordersServiceHash() => r'b3da4dd7a892fbd6a790fd454bc21e424488edf9';

/// See also [ordersService].
@ProviderFor(ordersService)
final ordersServiceProvider = Provider<OrdersService>.internal(
  ordersService,
  name: r'ordersServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ordersServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OrdersServiceRef = ProviderRef<OrdersService>;
String _$orderHash() => r'613f6c8297280146a1d8995101576720935c83e4';

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

/// See also [order].
@ProviderFor(order)
const orderProvider = OrderFamily();

/// See also [order].
class OrderFamily extends Family<AsyncValue<Order?>> {
  /// See also [order].
  const OrderFamily();

  /// See also [order].
  OrderProvider call(
    String id,
  ) {
    return OrderProvider(
      id,
    );
  }

  @override
  OrderProvider getProviderOverride(
    covariant OrderProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'orderProvider';
}

/// See also [order].
class OrderProvider extends AutoDisposeFutureProvider<Order?> {
  /// See also [order].
  OrderProvider(
    String id,
  ) : this._internal(
          (ref) => order(
            ref as OrderRef,
            id,
          ),
          from: orderProvider,
          name: r'orderProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$orderHash,
          dependencies: OrderFamily._dependencies,
          allTransitiveDependencies: OrderFamily._allTransitiveDependencies,
          id: id,
        );

  OrderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Order?> Function(OrderRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OrderProvider._internal(
        (ref) => create(ref as OrderRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Order?> createElement() {
    return _OrderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OrderRef on AutoDisposeFutureProviderRef<Order?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _OrderProviderElement extends AutoDisposeFutureProviderElement<Order?>
    with OrderRef {
  _OrderProviderElement(super.provider);

  @override
  String get id => (origin as OrderProvider).id;
}

String _$ordersHash() => r'5a86887f4d39e1eaec0005e8d5ce38a6d9e50f8c';

/// See also [orders].
@ProviderFor(orders)
final ordersProvider = AutoDisposeFutureProvider<List<Order>>.internal(
  orders,
  name: r'ordersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ordersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OrdersRef = AutoDisposeFutureProviderRef<List<Order>>;
String _$groupedOrdersHash() => r'41c5a8021a848c3583f9df2792a3331ec35a7aab';

/// See also [groupedOrders].
@ProviderFor(groupedOrders)
final groupedOrdersProvider =
    AutoDisposeFutureProvider<Map<DateTime, List<Order>>>.internal(
  groupedOrders,
  name: r'groupedOrdersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupedOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GroupedOrdersRef
    = AutoDisposeFutureProviderRef<Map<DateTime, List<Order>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
