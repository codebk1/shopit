// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$defaultAddressHash() => r'22ba0cbec761f76c8afc37cda0e1ee9e3e3bc008';

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

/// See also [defaultAddress].
@ProviderFor(defaultAddress)
const defaultAddressProvider = DefaultAddressFamily();

/// See also [defaultAddress].
class DefaultAddressFamily extends Family<AsyncValue<Address?>> {
  /// See also [defaultAddress].
  const DefaultAddressFamily();

  /// See also [defaultAddress].
  DefaultAddressProvider call(
    AddressType type,
  ) {
    return DefaultAddressProvider(
      type,
    );
  }

  @override
  DefaultAddressProvider getProviderOverride(
    covariant DefaultAddressProvider provider,
  ) {
    return call(
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
  String? get name => r'defaultAddressProvider';
}

/// See also [defaultAddress].
class DefaultAddressProvider extends FutureProvider<Address?> {
  /// See also [defaultAddress].
  DefaultAddressProvider(
    AddressType type,
  ) : this._internal(
          (ref) => defaultAddress(
            ref as DefaultAddressRef,
            type,
          ),
          from: defaultAddressProvider,
          name: r'defaultAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$defaultAddressHash,
          dependencies: DefaultAddressFamily._dependencies,
          allTransitiveDependencies:
              DefaultAddressFamily._allTransitiveDependencies,
          type: type,
        );

  DefaultAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final AddressType type;

  @override
  Override overrideWith(
    FutureOr<Address?> Function(DefaultAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DefaultAddressProvider._internal(
        (ref) => create(ref as DefaultAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  FutureProviderElement<Address?> createElement() {
    return _DefaultAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DefaultAddressProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DefaultAddressRef on FutureProviderRef<Address?> {
  /// The parameter `type` of this provider.
  AddressType get type;
}

class _DefaultAddressProviderElement extends FutureProviderElement<Address?>
    with DefaultAddressRef {
  _DefaultAddressProviderElement(super.provider);

  @override
  AddressType get type => (origin as DefaultAddressProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
