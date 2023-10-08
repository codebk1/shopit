import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/wishlist/wishlist.dart';

part 'wishlist_controller.g.dart';

@riverpod
class WishlistController extends _$WishlistController {
  @override
  FutureOr<Wishlist> build() {
    return ref.watch(wishlistServiceProvider).get();
  }

  Future<void> toggle(String itemId) async {
    final wishlist = await future;

    final index = wishlist.items.indexOf(itemId);

    state = await AsyncValue.guard(() async {
      final newWishlist = wishlist.copyWith(
        items: index != -1
            ? ([...wishlist.items]..removeAt(index))
            : [...wishlist.items, itemId],
      );

      await ref.read(wishlistServiceProvider).update(newWishlist);

      return newWishlist;
    });
  }
}

@riverpod
int wishlistItemsCount(WishlistItemsCountRef ref) {
  return ref.watch(wishlistControllerProvider).maybeWhen(
        skipLoadingOnReload: true,
        data: (wishlist) => wishlist.items.length,
        orElse: () => 0,
      );
}
