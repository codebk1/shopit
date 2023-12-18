import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class CategoriesSupabaseDataSource implements ICategoriesRemoteDataSource {
  const CategoriesSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  supabase.SupabaseQueryBuilder get _categoriesRef =>
      _supabase.from('categories');

  @override
  Future<int> count() async {
    try {
      final response = await _categoriesRef.select(
        '*',
        const supabase.FetchOptions(
          count: supabase.CountOption.exact,
          head: true,
        ),
      );

      return response.count;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Category>> paginate(
    String startAfter,
    int limit,
    Sort sort,
  ) async {
    try {
      final query = _categoriesRef.select();

      sort.descending && startAfter.isNotEmpty
          ? query.lt(sort.column, startAfter)
          : query.gt(sort.column, startAfter);

      final response = await query
          .order(sort.column, ascending: !sort.descending)
          .limit(limit);

      return response
          .map<Category>((category) => Category.fromJson(category))
          .toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Category>> featured() async {
    try {
      final response = await _categoriesRef.select().eq('featured', true);

      return response
          .map<Category>((category) => Category.fromJson(category))
          .toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Category>> byIds(List<String> ids) async {
    try {
      final response = await _categoriesRef.select().in_('id', ids);

      return response
          .map<Category>((category) => Category.fromJson(category))
          .toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
