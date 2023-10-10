// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressesServiceHash() => r'b23cc8cef86af7d06eb6a6293aee69c1f110d09f';

/// See also [addressesService].
@ProviderFor(addressesService)
final addressesServiceProvider = AutoDisposeProvider<AddressesService>.internal(
  addressesService,
  name: r'addressesServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressesServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddressesServiceRef = AutoDisposeProviderRef<AddressesService>;
String _$addressHash() => r'03d858810b1dd914a210d22460897f23e83dccca';

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

/// See also [address].
@ProviderFor(address)
const addressProvider = AddressFamily();

/// See also [address].
class AddressFamily extends Family<AsyncValue<Address?>> {
  /// See also [address].
  const AddressFamily();

  /// See also [address].
  AddressProvider call(
    String id,
    AddressType type,
  ) {
    return AddressProvider(
      id,
      type,
    );
  }

  @override
  AddressProvider getProviderOverride(
    covariant AddressProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'addressProvider';
}

/// See also [address].
class AddressProvider extends AutoDisposeFutureProvider<Address?> {
  /// See also [address].
  AddressProvider(
    String id,
    AddressType type,
  ) : this._internal(
          (ref) => address(
            ref as AddressRef,
            id,
            type,
          ),
          from: addressProvider,
          name: r'addressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addressHash,
          dependencies: AddressFamily._dependencies,
          allTransitiveDependencies: AddressFamily._allTransitiveDependencies,
          id: id,
          type: type,
        );

  AddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.type,
  }) : super.internal();

  final String id;
  final AddressType type;

  @override
  Override overrideWith(
    FutureOr<Address?> Function(AddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddressProvider._internal(
        (ref) => create(ref as AddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Address?> createElement() {
    return _AddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddressProvider && other.id == id && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddressRef on AutoDisposeFutureProviderRef<Address?> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `type` of this provider.
  AddressType get type;
}

class _AddressProviderElement extends AutoDisposeFutureProviderElement<Address?>
    with AddressRef {
  _AddressProviderElement(super.provider);

  @override
  String get id => (origin as AddressProvider).id;
  @override
  AddressType get type => (origin as AddressProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
