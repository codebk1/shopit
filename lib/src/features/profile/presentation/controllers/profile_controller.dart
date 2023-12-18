import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  @override
  FutureOr<Profile?> build() async {
    return ref.watch(profileProvider.future);
  }

  Future<void> updateProfile(
    Profile profile, {
    bool updateAvatar = false,
  }) async {
    final newProfile = await ref
        .read(profileRepositoryProvider)
        .update(profile, updateAvatar: updateAvatar);

    state = AsyncData(newProfile);
  }

  Future<void> setDefaultAddress(Address address) async {
    final profile = await future;

    if (profile != null) {
      state = await AsyncValue.guard(() {
        return ref.read(profileRepositoryProvider).update(
              address.type == AddressType.delivery
                  ? profile.copyWith(deliveryAddress: address.id)
                  : profile.copyWith(paymentAddress: address.id),
            );
      });
    }
  }

  Future<void> setWishlist(Wishlist wishlist) async {
    final profile = await future;

    if (profile != null) {
      state = await AsyncValue.guard(() {
        return ref
            .read(profileRepositoryProvider)
            .update(profile.copyWith(wishlist: wishlist));
      });
    }
  }

  Future<void> setCheckout(Checkout checkout) async {
    final profile = await future;

    if (profile != null) {
      state = await AsyncValue.guard(() {
        return ref
            .read(profileRepositoryProvider)
            .update(profile.copyWith(checkout: checkout));
      });
    }
  }
}
