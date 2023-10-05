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
    String id,
  ) : this._internal(
          (ref) => productsCount(
            ref as ProductsCountRef,
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
          id: id,
        );

  ProductsCountProvider._internal(
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
    FutureOr<int> Function(ProductsCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductsCountProvider._internal(
        (ref) => create(ref as ProductsCountRef),
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
  AutoDisposeFutureProviderElement<int> createElement() {
    return _ProductsCountProviderElement(this);
  }

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

mixin ProductsCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductsCountProviderElement
    extends AutoDisposeFutureProviderElement<int> with ProductsCountRef {
  _ProductsCountProviderElement(super.provider);

  @override
  String get id => (origin as ProductsCountProvider).id;
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
    r'4006eec4702ee216c1e1a8cf2355c88e590f420b';

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
    String categoryId,
  ) : this._internal(
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
          categoryId: categoryId,
        );

  ProductsPageControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
  }) : super.internal();

  final String categoryId;

  @override
  FutureOr<PageMeta<Product>> runNotifierBuild(
    covariant ProductsPageController notifier,
  ) {
    return notifier.build(
      categoryId,
    );
  }

  @override
  Override overrideWith(ProductsPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductsPageControllerProvider._internal(
        () => create()..categoryId = categoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductsPageController,
      PageMeta<Product>> createElement() {
    return _ProductsPageControllerProviderElement(this);
  }

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
}

mixin ProductsPageControllerRef
    on AutoDisposeAsyncNotifierProviderRef<PageMeta<Product>> {
  /// The parameter `categoryId` of this provider.
  String get categoryId;
}

class _ProductsPageControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductsPageController,
        PageMeta<Product>> with ProductsPageControllerRef {
  _ProductsPageControllerProviderElement(super.provider);

  @override
  String get categoryId =>
      (origin as ProductsPageControllerProvider).categoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
