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

String _$productsPageHash() => r'7a3c623f0c2fa5a1f6adcbabdd68c7f00275e0ce';
typedef ProductsPageRef = AutoDisposeFutureProviderRef<List<Product>>;

/// See also [productsPage].
@ProviderFor(productsPage)
const productsPageProvider = ProductsPageFamily();

/// See also [productsPage].
class ProductsPageFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [productsPage].
  const ProductsPageFamily();

  /// See also [productsPage].
  ProductsPageProvider call(
    PageMeta meta,
  ) {
    return ProductsPageProvider(
      meta,
    );
  }

  @override
  ProductsPageProvider getProviderOverride(
    covariant ProductsPageProvider provider,
  ) {
    return call(
      provider.meta,
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
  String? get name => r'productsPageProvider';
}

/// See also [productsPage].
class ProductsPageProvider extends AutoDisposeFutureProvider<List<Product>> {
  /// See also [productsPage].
  ProductsPageProvider(
    this.meta,
  ) : super.internal(
          (ref) => productsPage(
            ref,
            meta,
          ),
          from: productsPageProvider,
          name: r'productsPageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productsPageHash,
          dependencies: ProductsPageFamily._dependencies,
          allTransitiveDependencies:
              ProductsPageFamily._allTransitiveDependencies,
        );

  final PageMeta meta;

  @override
  bool operator ==(Object other) {
    return other is ProductsPageProvider && other.meta == meta;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, meta.hashCode);

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
    r'511ab9cc75d805fb8fe5a0153d226b1c47662dba';

/// See also [ProductsPageController].
@ProviderFor(ProductsPageController)
final productsPageControllerProvider =
    AutoDisposeNotifierProvider<ProductsPageController, int>.internal(
  ProductsPageController.new,
  name: r'productsPageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsPageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsPageController = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
