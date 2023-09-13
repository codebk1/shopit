// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsCountHash() => r'b530a3edf25a596520c1d6be5c71b030a0a73caf';

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

typedef ProductsCountRef = AutoDisposeFutureProviderRef<int>;

/// See also [productsCount].
@ProviderFor(productsCount)
const productsCountProvider = ProductsCountFamily();

/// See also [productsCount].
class ProductsCountFamily extends Family<AsyncValue<int>> {
  /// See also [productsCount].
  const ProductsCountFamily();

  /// See also [productsCount].
  ProductsCountProvider call(
    String id,
  ) {
    return ProductsCountProvider(
      id,
    );
  }

  @override
  ProductsCountProvider getProviderOverride(
    covariant ProductsCountProvider provider,
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
  String? get name => r'productsCountProvider';
}

/// See also [productsCount].
class ProductsCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [productsCount].
  ProductsCountProvider(
    this.id,
  ) : super.internal(
          (ref) => productsCount(
            ref,
            id,
          ),
          from: productsCountProvider,
          name: r'productsCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsCountHash,
          dependencies: ProductsCountFamily._dependencies,
          allTransitiveDependencies:
              ProductsCountFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is ProductsCountProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$productsSortHash() => r'ec65fe222d84246ed6aef260f6d3657bdee9142b';

/// See also [ProductsSort].
@ProviderFor(ProductsSort)
final productsSortProvider =
    AutoDisposeNotifierProvider<ProductsSort, Sort>.internal(
  ProductsSort.new,
  name: r'productsSortProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsSortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsSort = AutoDisposeNotifier<Sort>;
String _$productsPageControllerHash() =>
    r'77708bdc0949ffcb16b1f3f0feb2336efac05e8c';

abstract class _$ProductsPageController
    extends BuildlessAutoDisposeAsyncNotifier<PageMeta<Product>> {
  late final String categoryId;

  FutureOr<PageMeta<Product>> build(
    String categoryId,
  );
}

/// See also [ProductsPageController].
@ProviderFor(ProductsPageController)
const productsPageControllerProvider = ProductsPageControllerFamily();

/// See also [ProductsPageController].
class ProductsPageControllerFamily
    extends Family<AsyncValue<PageMeta<Product>>> {
  /// See also [ProductsPageController].
  const ProductsPageControllerFamily();

  /// See also [ProductsPageController].
  ProductsPageControllerProvider call(
    String categoryId,
  ) {
    return ProductsPageControllerProvider(
      categoryId,
    );
  }

  @override
  ProductsPageControllerProvider getProviderOverride(
    covariant ProductsPageControllerProvider provider,
  ) {
    return call(
      provider.categoryId,
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
  String? get name => r'productsPageControllerProvider';
}

/// See also [ProductsPageController].
class ProductsPageControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductsPageController,
        PageMeta<Product>> {
  /// See also [ProductsPageController].
  ProductsPageControllerProvider(
    this.categoryId,
  ) : super.internal(
          () => ProductsPageController()..categoryId = categoryId,
          from: productsPageControllerProvider,
          name: r'productsPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsPageControllerHash,
          dependencies: ProductsPageControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductsPageControllerFamily._allTransitiveDependencies,
        );

  final String categoryId;

  @override
  bool operator ==(Object other) {
    return other is ProductsPageControllerProvider &&
        other.categoryId == categoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<PageMeta<Product>> runNotifierBuild(
    covariant ProductsPageController notifier,
  ) {
    return notifier.build(
      categoryId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
