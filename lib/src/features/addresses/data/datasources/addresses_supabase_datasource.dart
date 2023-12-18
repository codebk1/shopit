import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class AddressesSupabaseDataSource implements IAddressesRemoteDataSource {
  AddressesSupabaseDataSource(this._supabase);

  final supabase.SupabaseClient _supabase;

  supabase.SupabaseQueryBuilder get _addressesRef =>
      _supabase.from('addresses');

  @override
  Future<Address?> getById(String _, AddressType type, String id) async {
    try {
      final response = await _addressesRef.select().eq('id', id).single();

      return Address.fromJson(response);
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Address>> getByType(String userId, AddressType type) async {
    try {
      final response = await _addressesRef
          .select()
          .eq('userId', userId)
          .eq('type', type.name)
          .order('createdAt', ascending: true);

      return response
          .map<Address>((address) => Address.fromJson(address))
          .toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<String> add(String _, Address address) async {
    try {
      final response = await _addressesRef
          .insert(address.toJson()..addAll({'type': address.type.name}))
          .select()
          .single();

      return response['id'];
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<void> delete(String _, Address address) async {
    try {
      await _addressesRef.delete().eq('id', address.id!);
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<void> set(String _, Address address) async {
    try {
      await _addressesRef
          .update(address.toJson()
            ..addAll({'updatedAt': DateTime.now().toIso8601String()}))
          .eq('id', address.id!);
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
