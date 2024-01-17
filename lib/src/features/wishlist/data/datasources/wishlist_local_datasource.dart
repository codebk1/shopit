import 'package:drift/drift.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class WishlistLocalDataSource implements IWishlistLocalDataSource {
  WishlistLocalDataSource(this._db);

  final AppDatabase _db;

  @override
  Future<List<String>> get() async {
    final rows = await _db.wishlist.select().get();

    return rows.map((row) => row.productId).toList();
  }

  @override
  Future<void> add(String id) {
    return _db.wishlist.insertOne(
      WishlistData(productId: id),
    );
  }

  @override
  Future<void> delete(String id) {
    return _db.wishlist.deleteWhere(
      (tbl) => tbl.productId.equals(id),
    );
  }

  @override
  Future<void> clear() {
    return _db.wishlist.deleteAll();
  }
}
