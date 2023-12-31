import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

part 'wishlist_repository.g.dart';

class WishlistRepository {
  WishlistRepository(this._localDataSource);

  final IWishlistLocalDataSource _localDataSource;

  Future<Wishlist> get() async {
    return await _localDataSource.get() ?? const Wishlist();
  }

  Future<void> update(Wishlist wishlist) async {
    return _localDataSource.update(wishlist);
  }

  Future<void> clear() async {
    return _localDataSource.clear();
  }
}

@Riverpod(keepAlive: true)
WishlistRepository wishlistRepository(WishlistRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  final localDataSource = WishlistIsarDataSource(isar);

  return WishlistRepository(localDataSource);
}
