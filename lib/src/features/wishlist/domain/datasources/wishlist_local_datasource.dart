import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';

abstract interface class IWishlistLocalDataSource {
  Future<Wishlist> get();
  Future<void> update(Wishlist wishlist);
  Future<void> clear();
}
