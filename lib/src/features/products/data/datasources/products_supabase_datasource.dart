import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/products/products.dart';

class ProductsSupabaseDataSource implements IProductsRemoteDataSource {
  const ProductsSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  supabase.SupabaseQueryBuilder get _productsRef => _supabase.from('products');

  @override
  Future<int> countByCategoryId(String id) async {
    try {
      final response = await _productsRef
          .select(
            '*',
            const supabase.FetchOptions(
              count: supabase.CountOption.exact,
              head: true,
            ),
          )
          .eq('categoryId', id);

      return response.count;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Product?> getById(String id) async {
    try {
      final response = await _productsRef.select().eq('id', id).single();

      return Product.fromJson(response);
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Product>> paginateByCategory(
    String id,
    Product? startAfter,
    int limit,
    Sort sort,
  ) async {
    try {
      const uniqueColumn = 'name';
      final query = _productsRef.select().eq('categoryId', id);

      query.order(sort.column, ascending: !sort.descending);

      if (startAfter != null) {
        final sortAfterValue = startAfter.toJson()[sort.column];

        if (sort.column == uniqueColumn) {
          sort.descending
              ? query.lt(sort.column, sortAfterValue)
              : query.gt(sort.column, sortAfterValue);
        } else {
          final orderByFilter = sort.descending ? 'lt' : 'gt';

          query.or(
            '${sort.column}.$orderByFilter.$sortAfterValue,and(${sort.column}.eq.$sortAfterValue,name.$orderByFilter.${startAfter.name})',
          );

          query.order(uniqueColumn, ascending: !sort.descending);
        }
      }

      final response = await query.limit(limit);

      return response
          .map<Product>((category) => Product.fromJson(category))
          .toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Product>> featured() async {
    try {
      final response = await _productsRef.select().eq('featured', true);

      return response
          .map<Product>((category) => Product.fromJson(category))
          .toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
