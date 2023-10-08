import 'package:isar/isar.dart';

import 'package:shopit/src/features/wishlist/wishlist.dart';

class WishlistIsarDataSource implements IWishlistLocalDataSource {
  WishlistIsarDataSource(this._isar);

  final Isar _isar;

  @override
  Future<Wishlist?> get() async {
    return _isar.wishlists.get('1');
  }

  @override
  Future<void> update(Wishlist wishlist) {
    return _isar.writeAsync(
      (isar) => isar.wishlists.put(wishlist),
    );
  }

  @override
  Future<void> clear() {
    return _isar.writeAsync(
      (isar) => isar.wishlists.clear(),
    );
  }
}
