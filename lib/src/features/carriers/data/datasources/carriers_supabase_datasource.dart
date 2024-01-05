import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class CarriersSupabaseDataSource implements ICarriersRemoteDataSource {
  const CarriersSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  supabase.SupabaseQueryBuilder get _carriersRef => _supabase.from('carriers');

  @override
  Future<List<Carrier>> get() async {
    try {
      final response = await _carriersRef.select();

      return response.map(Carrier.fromJson).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Carrier?> getById(String id) async {
    try {
      final response = await _carriersRef.select().eq('id', id).single();

      return Carrier.fromJson(response);
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
