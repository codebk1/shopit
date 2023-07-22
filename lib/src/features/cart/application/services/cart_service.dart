import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/cart/domain/entities/cart.dart';
import 'package:shopit/src/features/cart/data/repositories/cart_local_repository.dart';
import 'package:shopit/src/features/cart/data/repositories/cart_remote_repository.dart';

part 'cart_service.g.dart';

class CartService {
  CartService(
    this._user,
    this._localRepository,
    this._remoteRepository,
  );

  final User? _user;
  final CartLocalRepository _localRepository;
  final CartRemoteRepository _remoteRepository;

  Future<Cart> get() {
    return _user != null
        ? _remoteRepository.get(_user!.uid)
        : _localRepository.get();
  }

  Future<void> update(Cart cart) {
    return _user != null
        ? _remoteRepository.update(cart)
        : _localRepository.update(cart);
  }

  Future<void> clear(Cart cart) async {
    return _user != null
        ? _remoteRepository.clear(cart)
        : _localRepository.clear();
  }
}

@riverpod
CartService cartService(CartServiceRef ref) {
  final user = ref.watch(authStateChangesProvider).value;
  final localRepository = ref.watch(cartLocalRepositoryProvider);
  final remoteRepository = ref.watch(cartRemoteRepositoryProvider);

  return CartService(user, localRepository, remoteRepository);
}
