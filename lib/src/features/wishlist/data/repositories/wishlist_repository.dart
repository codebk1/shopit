import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

part 'wishlist_repository.g.dart';

class WishlistRepository {
  WishlistRepository(this._localDataSource);

  final IWishlistLocalDataSource _localDataSource;

  Future<List<String>> get() async {
    return await _localDataSource.get();
  }

  Future<void> add(String id) async {
    return _localDataSource.add(id);
  }

  Future<void> delete(String id) async {
    return _localDataSource.delete(id);
  }

  Future<void> clear() async {
    return _localDataSource.clear();
  }
}

@Riverpod(keepAlive: true)
WishlistRepository wishlistRepository(WishlistRepositoryRef ref) {
  final db = ref.watch(appDatabaseProvider);
  final localDataSource = WishlistLocalDataSource(db);

  return WishlistRepository(localDataSource);
}
