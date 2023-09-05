import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

part 'addresses_controller.g.dart';

@riverpod
class AddressesController extends _$AddressesController {
  @override
  FutureOr<List<Address>> build(AddressType type) async {
    final user = ref.read(authRepositoryProvider).currentUser!;

    return ref.read(addressesRepositoryProvider).getByType(user.id, type);
  }

  Future<void> add(Address address) async {
    final newAddress = await ref.read(addressesServiceProvider).add(address);

    state = AsyncData([
      ...state.requireValue,
      newAddress,
    ]);
  }

  Future<void> set(Address address) async {
    await ref.read(addressesServiceProvider).set(address);

    state = AsyncData([
      ...state.requireValue.map((e) => e.id == address.id ? address : e),
    ]);
  }

  Future<void> delete(Address address) async {
    await ref.read(addressesServiceProvider).delete(address);

    state = AsyncData(
      [...state.requireValue]..remove(address),
    );
  }
}
