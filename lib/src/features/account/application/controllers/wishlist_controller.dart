import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';

import 'package:shopit/src/features/account/data/repositories/account_repository.dart';
import 'package:shopit/src/features/products/domain/entities/product.dart';
import 'package:shopit/src/features/products/data/repositories/products_repository.dart';

part 'wishlist_controller.g.dart';

@riverpod
class WishlistController extends _$WishlistController {
  @override
  FutureOr<List<Product>> build() async {
    print('RRRRRJRJRRJRJRJ');

    final account = ref.watch(accountControllerProvider).value;

    if (account != null) {
      return ref
          .read(productsRepositoryProvider)
          .getProductsByIds(account.wishlist);
    }

    return [];
  }

  Future<void> toggle(Product product) async {
    final index = state.value!.indexOf(product);
    final oldState = state;

    List<Product> newWishlist;

    if (index != -1) {
      newWishlist = [...state.value!]..removeAt(index);
    } else {
      newWishlist = [...state.value!, product];
    }

    final account = ref.read(accountControllerProvider).value;

    state = await AsyncValue.guard(() async {
      if (account != null) {
        await ref.read(accountRepositoryProvider).updateAccount(
              account.copyWith(wishlist: newWishlist.map((e) => e.id).toList()),
            );
      }

      return newWishlist;
    });

    if (state.hasError) state = oldState;
  }
}

@riverpod
int wishlistItemsCount(WishlistItemsCountRef ref) {
  return ref.watch(wishlistControllerProvider).maybeWhen(
        data: (wishlist) => wishlist.length,
        orElse: () => 0,
      );
}
