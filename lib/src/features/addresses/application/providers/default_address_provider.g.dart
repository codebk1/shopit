// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'default_address_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$defaultAddressHash() => r'822092ce999df52dd89a161bb92b6f6795476db7';

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

typedef DefaultAddressRef = FutureProviderRef<Address?>;

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
    this.type,
  ) : super.internal(
          (ref) => defaultAddress(
            ref,
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
        );

  final AddressType type;

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
