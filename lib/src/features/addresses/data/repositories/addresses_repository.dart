import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'addresses_repository.g.dart';

class AddressesRepository {
  const AddressesRepository(this._remoteDataSource);

  final IAddressesRemoteDataSource _remoteDataSource;

  Future<Address?> getById(String userId, AddressType type, String id) {
    return _remoteDataSource.getById(userId, type, id);
  }

  Future<List<Address>> getByType(String userId, AddressType type) {
    return _remoteDataSource.getByType(userId, type);
  }

  Future<String> add(String userId, Address address) {
    return _remoteDataSource.add(userId, address);
  }

  Future<void> set(String userId, Address address) {
    return _remoteDataSource.set(userId, address);
  }

  Future<void> delete(String userId, Address address) {
    return _remoteDataSource.delete(userId, address);
  }
}

@Riverpod(keepAlive: true)
AddressesRepository addressesRepository(AddressesRepositoryRef ref) {
  final remoteDataSource = AddressesFirebaseDataSource(
    FirebaseFirestore.instance,
  );

  // final remoteDataSource = AddressesSupabaseDataSource(
  //   supabase.Supabase.instance.client,
  // );

  return AddressesRepository(remoteDataSource);
}
