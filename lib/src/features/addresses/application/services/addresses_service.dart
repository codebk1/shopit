import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

part 'addresses_service.g.dart';

class AddressesService {
  AddressesService(
    this._profile,
    this._profileController,
    this._addressesRepository,
  );

  final Profile _profile;
  final ProfileController _profileController;
  final AddressesRepository _addressesRepository;

  Future<Address?> getById(String id, AddressType type) async {
    final address = await _addressesRepository.getById(_profile.id, type, id);

    return address;
  }

  Future<Address> add(Address address) async {
    final id = await _addressesRepository.add(_profile.id, address);

    return address.copyWith(id: id);
  }

  Future<void> set(Address address) async {
    return _addressesRepository.set(_profile.id, address);
  }

  Future<void> delete(Address address) async {
    return _addressesRepository.delete(_profile.id, address);
  }

  Future<void> setDefaultAddress(Address address) async {
    final newProfile = address.type == AddressType.delivery
        ? _profile.copyWith(deliveryAddress: address.id)
        : _profile.copyWith(billingAddress: address.id);

    return _profileController.updateProfile(
      newProfile,
      updateAvatar: true,
    );
  }
}

@riverpod
AddressesService addressesService(AddressesServiceRef ref) {
  final profile = ref.watch(profileControllerProvider).value!;
  final profileController = ref.watch(profileControllerProvider.notifier);
  final addressesRepository = ref.watch(addressesRepositoryProvider);

  return AddressesService(profile, profileController, addressesRepository);
}
