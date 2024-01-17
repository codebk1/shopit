import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'wishlist_controller.g.dart';

@riverpod
class WishlistController extends _$WishlistController {
  @override
  FutureOr<List<String>> build() {
    return ref.watch(wishlistServiceProvider).get();
  }

  Future<void> toggle(String itemId) async {
    final wishlist = await future;

    state = await AsyncValue.guard(() async {
      final index = wishlist.indexOf(itemId);
      if (index != -1) {
        await ref.read(wishlistServiceProvider).delete(itemId);

        return [...wishlist..removeAt(index)];
      } else {
        await ref.read(wishlistServiceProvider).add(itemId);

        return [...wishlist, itemId];
      }
    });
  }
}

@riverpod
int wishlistItemsCount(WishlistItemsCountRef ref) {
  return ref.watch(wishlistControllerProvider).maybeWhen(
        skipLoadingOnReload: true,
        data: (wishlist) => wishlist.length,
        orElse: () => 0,
      );
}
