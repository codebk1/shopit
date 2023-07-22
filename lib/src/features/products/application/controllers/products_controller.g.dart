// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productIdHash() => r'45c432b7de274c4e379590471c87ed7a0298f7b7';

/// See also [productId].
@ProviderFor(productId)
final productIdProvider = AutoDisposeProvider<String>.internal(
  productId,
  name: r'productIdProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productIdHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef ProductIdRef = AutoDisposeProviderRef<String>;
String _$productHash() => r'b1a0dc3d84b5005379406ffe2e22c8c2cb25ce30';

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

typedef ProductRef = AutoDisposeFutureProviderRef<Product?>;

/// See also [product].
@ProviderFor(product)
const productProvider = ProductFamily();

/// See also [product].
class ProductFamily extends Family<AsyncValue<Product?>> {
  /// See also [product].
  const ProductFamily();

  /// See also [product].
  ProductProvider call(
    String id,
  ) {
    return ProductProvider(
      id,
    );
  }

  @override
  ProductProvider getProviderOverride(
    covariant ProductProvider provider,
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
  String? get name => r'productProvider';
}

/// See also [product].
class ProductProvider extends AutoDisposeFutureProvider<Product?> {
  /// See also [product].
  ProductProvider(
    this.id,
  ) : super.internal(
          (ref) => product(
            ref,
            id,
          ),
          from: productProvider,
          name: r'productProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productHash,
          dependencies: ProductFamily._dependencies,
          allTransitiveDependencies: ProductFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$productsCountHash() => r'a74c3fb7f5270ae9850a85ac92e2116ff698a34b';
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

String _$productsPageHash() => r'1c24c310d09da4e8399903a9cd610d2d6929a820';
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
    ProductsPageMeta meta,
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

  final ProductsPageMeta meta;

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
