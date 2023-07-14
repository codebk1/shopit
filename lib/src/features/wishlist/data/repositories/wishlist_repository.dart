import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/utils/isar.dart';
import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:shopit/src/features/wishlist/domain/datasources/wishlist_local_datasource.dart';
import 'package:shopit/src/features/wishlist/data/datasources/wishlist_isar_datasource.dart';

part 'wishlist_repository.g.dart';

class WishlistRepository {
  WishlistRepository(this._localDataSource);

  final IWishlistLocalDataSource _localDataSource;

  Future<Wishlist> getWishlist() {
    return _localDataSource.getWishlist();
  }

  Future<void> updateWishlist(Wishlist wishlist) async {
    return _localDataSource.updateWishlist(wishlist);
  }
}

@Riverpod(keepAlive: true)
WishlistRepository wishlistRepository(WishlistRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  final localDataSource = WishlistIsarDataSource(isar);

  return WishlistRepository(localDataSource);
}