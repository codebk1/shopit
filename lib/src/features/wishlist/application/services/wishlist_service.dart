import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'wishlist_service.g.dart';

class WishlistService {
  WishlistService(
    this._wishlist,
    this._profileController,
    this._wishlistRepository,
  );

  final Wishlist? _wishlist;
  final ProfileController _profileController;
  final WishlistRepository _wishlistRepository;

  Future<Wishlist> get() async {
    return _wishlist ?? await _wishlistRepository.get();
  }

  Future<void> update(Wishlist wishlist) {
    return _wishlist != null
        ? _profileController.setWishlist(wishlist)
        : _wishlistRepository.update(wishlist);
  }
}

@riverpod
WishlistService wishlistService(WishlistServiceRef ref) {
  final wishlist = ref.watch(profileControllerProvider.select(
    (profile) => profile.value?.wishlist,
  ));

  final profileController = ref.read(profileControllerProvider.notifier);
  final wishlistRepository = ref.read(wishlistRepositoryProvider);

  return WishlistService(wishlist, profileController, wishlistRepository);
}
