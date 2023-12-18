import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'default_address_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Address?> defaultAddress(DefaultAddressRef ref, AddressType type) async {
  final addressId = await ref.watch(profileControllerProvider.selectAsync(
    (data) => type == AddressType.delivery
        ? data?.deliveryAddress
        : data?.paymentAddress,
  ));

  return addressId != null
      ? ref.read(addressesServiceProvider).getById(addressId, type)
      : null;
}
