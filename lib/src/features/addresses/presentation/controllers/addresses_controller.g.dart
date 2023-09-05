// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressesControllerHash() =>
    r'0547dba8850efc4ab40864ae1caa1ac9e93ad75c';

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

abstract class _$AddressesController
    extends BuildlessAutoDisposeAsyncNotifier<List<Address>> {
  late final AddressType type;

  FutureOr<List<Address>> build(
    AddressType type,
  );
}

/// See also [AddressesController].
@ProviderFor(AddressesController)
const addressesControllerProvider = AddressesControllerFamily();

/// See also [AddressesController].
class AddressesControllerFamily extends Family<AsyncValue<List<Address>>> {
  /// See also [AddressesController].
  const AddressesControllerFamily();

  /// See also [AddressesController].
  AddressesControllerProvider call(
    AddressType type,
  ) {
    return AddressesControllerProvider(
      type,
    );
  }

  @override
  AddressesControllerProvider getProviderOverride(
    covariant AddressesControllerProvider provider,
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
  String? get name => r'addressesControllerProvider';
}

/// See also [AddressesController].
class AddressesControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    AddressesController, List<Address>> {
  /// See also [AddressesController].
  AddressesControllerProvider(
    this.type,
  ) : super.internal(
          () => AddressesController()..type = type,
          from: addressesControllerProvider,
          name: r'addressesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addressesControllerHash,
          dependencies: AddressesControllerFamily._dependencies,
          allTransitiveDependencies:
              AddressesControllerFamily._allTransitiveDependencies,
        );

  final AddressType type;

  @override
  bool operator ==(Object other) {
    return other is AddressesControllerProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<List<Address>> runNotifierBuild(
    covariant AddressesController notifier,
  ) {
    return notifier.build(
      type,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
