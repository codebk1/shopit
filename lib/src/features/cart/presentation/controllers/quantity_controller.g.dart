// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantity_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$quantityControllerHash() =>
    r'c1d1e88702d1a12874b93f9fc7cdd36907ad4b6a';

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
    extends BuildlessAutoDisposeAsyncNotifier<Item> {
  late final Item item;

  FutureOr<Item> build(
    Item item,
  );
}

/// See also [QuantityController].
@ProviderFor(QuantityController)
const quantityControllerProvider = QuantityControllerFamily();

/// See also [QuantityController].
class QuantityControllerFamily extends Family<AsyncValue<Item>> {
  /// See also [QuantityController].
  const QuantityControllerFamily();

  /// See also [QuantityController].
  QuantityControllerProvider call(
    Item item,
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
    extends AutoDisposeAsyncNotifierProviderImpl<QuantityController, Item> {
  /// See also [QuantityController].
  QuantityControllerProvider(
    this.item,
  ) : super.internal(
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
        );

  final Item item;

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

  @override
  FutureOr<Item> runNotifierBuild(
    covariant QuantityController notifier,
  ) {
    return notifier.build(
      item,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member