import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopit/src/features/wishlist/data/datasources/local/wishlist_local_datasource.dart';
import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:shopit/src/utils/isar_provider.dart';

part 'wishlist_repository.g.dart';

class WishlistRepository {
  WishlistRepository(this._localDataSource);

  final WishlistsLocalDataSource _localDataSource;

  Future<Wishlist> getWishlist() {
    return _localDataSource.getWishlist();
  }

  Future<void> updateWishlist(Wishlist wishlist) async {
    await Future.delayed(Duration(seconds: 5));
    return _localDataSource.updateWishlist(wishlist);
  }
}

@Riverpod(keepAlive: true)
WishlistRepository wishlistRepository(WishlistRepositoryRef ref) {
  final isar = ref.read(isarProvider);
  final localDataSource = WishlistsLocalDataSource(isar);

  return WishlistRepository(localDataSource);
}
