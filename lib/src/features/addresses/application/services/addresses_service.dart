import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'addresses_service.g.dart';

class AddressesService {
  AddressesService(
    this._profile,
    this._addressesRepository,
  );

  final Profile _profile;
  final AddressesRepository _addressesRepository;

  Future<Address?> getById(String id, AddressType type) async {
    return await _addressesRepository.getById(_profile.id, type, id);
  }

  Future<List<Address>> getByType(AddressType type) async {
    return await _addressesRepository.getByType(_profile.id, type);
  }

  Future<Address> add(Address address) async {
    final id = await _addressesRepository.add(_profile.id, address);

    return address.copyWith(id: id);
  }

  Future<void> set(Address address) {
    return _addressesRepository.set(_profile.id, address);
  }

  Future<void> delete(Address address) {
    return _addressesRepository.delete(_profile.id, address);
  }
}

@riverpod
AddressesService addressesService(AddressesServiceRef ref) {
  final profile = ref.watch(profileProvider).valueOrNull!;
  final addressesRepository = ref.read(addressesRepositoryProvider);

  return AddressesService(profile, addressesRepository);
}

@riverpod
Future<Address?> address(AddressRef ref, String id, AddressType type) {
  return ref.watch(addressesServiceProvider).getById(id, type);
}
