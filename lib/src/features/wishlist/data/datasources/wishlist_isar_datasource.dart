import 'package:isar/isar.dart';

import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:shopit/src/features/wishlist/domain/datasources/wishlist_local_datasource.dart';

class WishlistIsarDataSource implements IWishlistLocalDataSource {
  WishlistIsarDataSource(this._isar);

  final Isar _isar;

  @override
  Future<Wishlist> get() async {
    return await _isar.wishlists.get(1) ?? const Wishlist(id: 1);
  }

  @override
  Future<void> update(Wishlist wishlist) {
    return _isar.writeTxn(() => _isar.wishlists.put(wishlist));
  }

  @override
  Future<void> clear() {
    return _isar.writeTxn(() => _isar.wishlists.clear());
  }
}
