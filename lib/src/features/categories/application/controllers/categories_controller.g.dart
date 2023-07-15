// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoriesCountHash() => r'c84f78e752116ef7d4e7f231f5d152e70cc28e83';

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
String _$categoriesPagesHash() => r'd8e7ed95461c8050662fbb19a3e4614a04d10e6b';

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

typedef CategoriesPagesRef = AutoDisposeFutureProviderRef<List<Category>>;

/// See also [categoriesPages].
@ProviderFor(categoriesPages)
const categoriesPagesProvider = CategoriesPagesFamily();

/// See also [categoriesPages].
class CategoriesPagesFamily extends Family<AsyncValue<List<Category>>> {
  /// See also [categoriesPages].
  const CategoriesPagesFamily();

  /// See also [categoriesPages].
  CategoriesPagesProvider call(
    int page,
  ) {
    return CategoriesPagesProvider(
      page,
    );
  }

  @override
  CategoriesPagesProvider getProviderOverride(
    covariant CategoriesPagesProvider provider,
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
  String? get name => r'categoriesPagesProvider';
}

/// See also [categoriesPages].
class CategoriesPagesProvider
    extends AutoDisposeFutureProvider<List<Category>> {
  /// See also [categoriesPages].
  CategoriesPagesProvider(
    this.page,
  ) : super.internal(
          (ref) => categoriesPages(
            ref,
            page,
          ),
          from: categoriesPagesProvider,
          name: r'categoriesPagesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$categoriesPagesHash,
          dependencies: CategoriesPagesFamily._dependencies,
          allTransitiveDependencies:
              CategoriesPagesFamily._allTransitiveDependencies,
        );

  final int page;

  @override
  bool operator ==(Object other) {
    return other is CategoriesPagesProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$categoryHash() => r'd9ab36b0be0bd628845c4a7f6fb7b45ee60ece7d';
typedef CategoryRef = AutoDisposeProviderRef<AsyncValue<Category>>;

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
    this.index,
  ) : super.internal(
          (ref) => category(
            ref,
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
        );

  final int index;

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
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
