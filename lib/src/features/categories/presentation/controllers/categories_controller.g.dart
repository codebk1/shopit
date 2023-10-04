// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesCountHash() => r'c954f5fddfa655fc2308606726bc41de1ac22d00';

/// See also [categoriesCount].
@ProviderFor(categoriesCount)
final categoriesCountProvider = AutoDisposeFutureProvider<int>.internal(
  categoriesCount,
  name: r'categoriesCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoriesCountRef = AutoDisposeFutureProviderRef<int>;
String _$categoriesPageHash() => r'4c6451575603d04cf5b573d6e881511bdd613900';

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

/// See also [categoriesPage].
@ProviderFor(categoriesPage)
const categoriesPageProvider = CategoriesPageFamily();

/// See also [categoriesPage].
class CategoriesPageFamily extends Family<AsyncValue<List<Category>>> {
  /// See also [categoriesPage].
  const CategoriesPageFamily();

  /// See also [categoriesPage].
  CategoriesPageProvider call(
    int page,
  ) {
    return CategoriesPageProvider(
      page,
    );
  }

  @override
  CategoriesPageProvider getProviderOverride(
    covariant CategoriesPageProvider provider,
  ) {
    return call(
      provider.page,
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
  String? get name => r'categoriesPageProvider';
}

/// See also [categoriesPage].
class CategoriesPageProvider extends AutoDisposeFutureProvider<List<Category>> {
  /// See also [categoriesPage].
  CategoriesPageProvider(
    int page,
  ) : this._internal(
          (ref) => categoriesPage(
            ref as CategoriesPageRef,
            page,
          ),
          from: categoriesPageProvider,
          name: r'categoriesPageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoriesPageHash,
          dependencies: CategoriesPageFamily._dependencies,
          allTransitiveDependencies:
              CategoriesPageFamily._allTransitiveDependencies,
          page: page,
        );

  CategoriesPageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<List<Category>> Function(CategoriesPageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoriesPageProvider._internal(
        (ref) => create(ref as CategoriesPageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Category>> createElement() {
    return _CategoriesPageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoriesPageProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoriesPageRef on AutoDisposeFutureProviderRef<List<Category>> {
  /// The parameter `page` of this provider.
  int get page;
}

class _CategoriesPageProviderElement
    extends AutoDisposeFutureProviderElement<List<Category>>
    with CategoriesPageRef {
  _CategoriesPageProviderElement(super.provider);

  @override
  int get page => (origin as CategoriesPageProvider).page;
}

String _$categoryHash() => r'1421dbe1d2b43d124d15b0716a206b65b8d4a643';

/// See also [category].
@ProviderFor(category)
const categoryProvider = CategoryFamily();

/// See also [category].
class CategoryFamily extends Family<AsyncValue<Category>> {
  /// See also [category].
  const CategoryFamily();

  /// See also [category].
  CategoryProvider call(
    int index,
  ) {
    return CategoryProvider(
      index,
    );
  }

  @override
  CategoryProvider getProviderOverride(
    covariant CategoryProvider provider,
  ) {
    return call(
      provider.index,
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
  String? get name => r'categoryProvider';
}

/// See also [category].
class CategoryProvider extends AutoDisposeProvider<AsyncValue<Category>> {
  /// See also [category].
  CategoryProvider(
    int index,
  ) : this._internal(
          (ref) => category(
            ref as CategoryRef,
            index,
          ),
          from: categoryProvider,
          name: r'categoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoryHash,
          dependencies: CategoryFamily._dependencies,
          allTransitiveDependencies: CategoryFamily._allTransitiveDependencies,
          index: index,
        );

  CategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    AsyncValue<Category> Function(CategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CategoryProvider._internal(
        (ref) => create(ref as CategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<Category>> createElement() {
    return _CategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CategoryRef on AutoDisposeProviderRef<AsyncValue<Category>> {
  /// The parameter `index` of this provider.
  int get index;
}

class _CategoryProviderElement
    extends AutoDisposeProviderElement<AsyncValue<Category>> with CategoryRef {
  _CategoryProviderElement(super.provider);

  @override
  int get index => (origin as CategoryProvider).index;
}

String _$categoriesSortHash() => r'3729fc2a3d5117ee6d4dc981bbb23f99c74aaae0';

/// See also [CategoriesSort].
@ProviderFor(CategoriesSort)
final categoriesSortProvider =
    AutoDisposeNotifierProvider<CategoriesSort, Sort>.internal(
  CategoriesSort.new,
  name: r'categoriesSortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoriesSortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CategoriesSort = AutoDisposeNotifier<Sort>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
