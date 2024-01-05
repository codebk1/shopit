import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class OrdersSupabaseDataSource implements IOrdersRemoteDataSource {
  const OrdersSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  supabase.SupabaseQueryBuilder get _ordersRef => _supabase.from('orders');

  @override
  Future<List<Order>> get(String uid) async {
    try {
      final response =
          await _ordersRef.select().eq('userId', uid).order('createdAt');

      return response.map(Order.fromJson).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Order?> getById(String _, String id) async {
    try {
      final response = await _ordersRef.select().eq('id', id).single();

      return Order.fromJson(response);
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Order?> latest(String uid) async {
    try {
      final response = await _ordersRef
          .select()
          .eq('userId', uid)
          .order('createdAt')
          .limit(1)
          .single();

      return Order.fromJson(response);
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<int> count(String _) async {
    try {
      return await _ordersRef.count();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<String> add(String _, Order order) async {
    try {
      final config = await _supabase
          .from('config')
          .select()
          .eq('key', 'latestOrderNumber')
          .single();

      final orderNumber = int.parse(config['value']) + 1;

      await _supabase
          .from('config')
          .update({'value': orderNumber}).eq('key', 'latestOrderNumber');

      final response = await _ordersRef
          .insert({
            ...order.toJson(),
            'number': orderNumber,
            if (order.id == null) 'createdAt': DateTime.now().toIso8601String(),
            'updatedAt': DateTime.now().toIso8601String(),
          })
          .select('id')
          .single();

      return response['id'];
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
