import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:shopit/src/features/wishlist/application/services/wishlist_service.dart';

part 'wishlist_controller.g.dart';

@riverpod
class WishlistController extends _$WishlistController {
  @override
  FutureOr<Wishlist> build() async {
    return ref.watch(wishlistServiceProvider).get();
  }

  Future<void> toggle(String itemId) async {
    final index = state.value!.items.indexOf(itemId);

    List<String> newItems;

    if (index != -1) {
      newItems = [...state.value!.items]..removeAt(index);
    } else {
      newItems = [...state.value!.items, itemId];
    }

    state = await AsyncValue.guard(() async {
      final wishlist = state.value!.copyWith(items: newItems);
      await ref.read(wishlistServiceProvider).update(wishlist);

      return wishlist;
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
