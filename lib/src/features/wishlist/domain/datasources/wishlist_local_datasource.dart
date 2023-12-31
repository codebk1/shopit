import 'package:shopit/src/features/features.dart';

abstract interface class IWishlistLocalDataSource {
  Future<Wishlist?> get();
  Future<void> update(Wishlist wishlist);
  Future<void> clear();
}
