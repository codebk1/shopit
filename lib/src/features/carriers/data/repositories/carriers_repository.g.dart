// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carriers_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carriersRepositoryHash() =>
    r'b3e37d802e4dacb133d624444fba2f1ac946b74f';

/// See also [carriersRepository].
@ProviderFor(carriersRepository)
final carriersRepositoryProvider = Provider<CarriersRepository>.internal(
  carriersRepository,
  name: r'carriersRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carriersRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CarriersRepositoryRef = ProviderRef<CarriersRepository>;
String _$carriersHash() => r'94e93adf6d1c20718da3d74af8d353ab7a7387a2';

/// See also [carriers].
@ProviderFor(carriers)
final carriersProvider = AutoDisposeFutureProvider<List<Carrier>>.internal(
  carriers,
  name: r'carriersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$carriersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CarriersRef = AutoDisposeFutureProviderRef<List<Carrier>>;
String _$carrierHash() => r'8f9ed8d9e6bef811495a229b02e1d14cfbaa8c09';

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

/// See also [carrier].
@ProviderFor(carrier)
const carrierProvider = CarrierFamily();

/// See also [carrier].
class CarrierFamily extends Family<AsyncValue<Carrier?>> {
  /// See also [carrier].
  const CarrierFamily();

  /// See also [carrier].
  CarrierProvider call(
    String id,
  ) {
    return CarrierProvider(
      id,
    );
  }

  @override
  CarrierProvider getProviderOverride(
    covariant CarrierProvider provider,
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
  String? get name => r'carrierProvider';
}

/// See also [carrier].
class CarrierProvider extends AutoDisposeFutureProvider<Carrier?> {
  /// See also [carrier].
  CarrierProvider(
    String id,
  ) : this._internal(
          (ref) => carrier(
            ref as CarrierRef,
            id,
          ),
          from: carrierProvider,
          name: r'carrierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$carrierHash,
          dependencies: CarrierFamily._dependencies,
          allTransitiveDependencies: CarrierFamily._allTransitiveDependencies,
          id: id,
        );

  CarrierProvider._internal(
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
    FutureOr<Carrier?> Function(CarrierRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CarrierProvider._internal(
        (ref) => create(ref as CarrierRef),
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
  AutoDisposeFutureProviderElement<Carrier?> createElement() {
    return _CarrierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CarrierProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CarrierRef on AutoDisposeFutureProviderRef<Carrier?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _CarrierProviderElement extends AutoDisposeFutureProviderElement<Carrier?>
    with CarrierRef {
  _CarrierProviderElement(super.provider);

  @override
  String get id => (origin as CarrierProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
