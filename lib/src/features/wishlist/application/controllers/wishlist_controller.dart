import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/account/data/repositories/account_repository.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';
import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:shopit/src/features/wishlist/data/repositories/wishlist_repository.dart';

part 'wishlist_controller.g.dart';

@riverpod
class WishlistController extends _$WishlistController {
  @override
  FutureOr<Wishlist> build() async {
    final account = await ref.watch(accountControllerProvider.future);

    if (account != null) {
      return account.wishlist;
    } else {
      return ref.read(wishlistRepositoryProvider).getWishlist();
    }
  }

  Future<void> toggle(String itemId) async {
    final index = state.value!.items.indexOf(itemId);

    List<String> newItems;

    if (index != -1) {
      newItems = [...state.value!.items]..removeAt(index);
    } else {
      newItems = [...state.value!.items, itemId];
    }

    final account = ref.read(accountControllerProvider).value;
    final accountRepository = ref.read(accountRepositoryProvider);
    final wishlistRepository = ref.read(wishlistRepositoryProvider);

    state = await AsyncValue.guard(() async {
      final wishlist = state.value!.copyWith(items: newItems);

      if (account != null) {
        await accountRepository.updateAccount(
          account.copyWith(wishlist: wishlist),
        );
      } else {
        await wishlistRepository.updateWishlist(wishlist);
      }

      return wishlist;
    });
  }
}

@riverpod
int wishlistItemsCount(WishlistItemsCountRef ref) {
  return ref.watch(wishlistControllerProvider).maybeWhen(
        data: (wishlist) => wishlist.items.length,
        orElse: () => 0,
      );
}
