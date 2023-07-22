import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';
import 'package:shopit/src/features/account/application/controllers/account_controller.dart';
import 'package:shopit/src/features/wishlist/domain/entities/wishlist.dart';
import 'package:shopit/src/features/wishlist/data/repositories/wishlist_repository.dart';

part 'wishlist_service.g.dart';

class WishlistService {
  WishlistService(
    this._account,
    this._accountRepository,
    this._wishlistRepository,
  );

  final Account? _account;
  final AccountRepository _accountRepository;
  final WishlistRepository _wishlistRepository;

  Future<Wishlist> get() async {
    if (_account != null) {
      return _account!.wishlist;
    }

    return _wishlistRepository.get();
  }

  Future<void> update(Wishlist wishlist) {
    return _account != null
        ? _accountRepository.update(
            _account!.copyWith(wishlist: wishlist),
          )
        : _wishlistRepository.update(wishlist);
  }
}

@riverpod
WishlistService wishlistService(WishlistServiceRef ref) {
  final account = ref.watch(accountProvider).value;
  final accountRepository = ref.watch(accountRepositoryProvider);
  final wishlistRepository = ref.watch(wishlistRepositoryProvider);

  return WishlistService(account, accountRepository, wishlistRepository);
}
