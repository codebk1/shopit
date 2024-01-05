import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class PaymentsSupabaseDataSource implements IPaymentsRemoteDataSource {
  const PaymentsSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  supabase.SupabaseQueryBuilder get _paymentsRef => _supabase.from('payments');

  @override
  Future<List<Payment>> get() async {
    try {
      final response = await _paymentsRef.select();

      return response.map(Payment.fromJson).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Payment?> getById(String id) async {
    try {
      final response = await _paymentsRef.select().eq('id', id).single();

      return Payment.fromJson(response);
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
