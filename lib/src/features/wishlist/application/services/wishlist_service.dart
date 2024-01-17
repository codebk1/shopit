import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'wishlist_service.g.dart';

class WishlistService {
  WishlistService(
    this._wishlist,
    this._profileController,
    this._wishlistRepository,
  );

  final List<String>? _wishlist;
  final ProfileController _profileController;
  final WishlistRepository _wishlistRepository;

  Future<List<String>> get() async {
    return _wishlist ?? await _wishlistRepository.get();
  }

  Future<void> add(String id) {
    return _wishlist != null
        ? _profileController.addWishlistItem(id)
        : _wishlistRepository.add(id);
  }

  Future<void> delete(String id) {
    return _wishlist != null
        ? _profileController.deleteWishlistItem(id)
        : _wishlistRepository.delete(id);
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
