import 'package:shopit/src/features/addresses/addresses.dart';

abstract interface class IAddressesRemoteDataSource {
  Future<Address?> getById(String userId, AddressType type, String id);
  Future<List<Address>> getByType(String userId, AddressType type);
  Future<String> add(String userId, Address address);
  Future<void> set(String userId, Address address);
  Future<void> delete(String userId, Address address);
}
