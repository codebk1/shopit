import 'package:isar/isar.dart';
import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';

class WishlistsLocalDataSource {
  WishlistsLocalDataSource(this._isar);

  final Isar _isar;

  Future<Wishlist> getWishlist() async {
    return await _isar.wishlists.get(1) ?? const Wishlist(id: 1);
  }

  Future<void> updateWishlist(Wishlist wishlist) {
    return _isar.writeTxn(() => _isar.wishlists.put(wishlist));
  }
}
