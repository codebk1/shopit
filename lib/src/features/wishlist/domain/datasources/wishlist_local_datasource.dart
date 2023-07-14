import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';

abstract class IWishlistLocalDataSource {
  Future<Wishlist> getWishlist();
  Future<void> updateWishlist(Wishlist wishlist);
}
