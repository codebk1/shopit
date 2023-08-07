import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:shopit/src/features/wishlist/data/repositories/wishlist_repository.dart';

part 'wishlist_service.g.dart';

class WishlistService {
  WishlistService(
    this._profile,
    this._profileRepository,
    this._wishlistRepository,
  );

  final Profile? _profile;
  final ProfileRepository _profileRepository;
  final WishlistRepository _wishlistRepository;

  Future<Wishlist> get() async {
    if (_profile != null) {
      return _profile!.wishlist;
    }

    return _wishlistRepository.get();
  }

  Future<void> update(Wishlist wishlist) {
    return _profile != null
        ? _profileRepository.update(
            _profile!.copyWith(wishlist: wishlist),
          )
        : _wishlistRepository.update(wishlist);
  }
}

@riverpod
WishlistService wishlistService(WishlistServiceRef ref) {
  final profile = ref.watch(profileControllerProvider).value;
  final profileRepository = ref.watch(profileRepositoryProvider);
  final wishlistRepository = ref.watch(wishlistRepositoryProvider);

  return WishlistService(profile, profileRepository, wishlistRepository);
}
