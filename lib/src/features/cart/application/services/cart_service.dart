import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/cart/cart.dart';
import 'package:shopit/src/features/profile/profile.dart';

part 'cart_service.g.dart';

class CartService {
  CartService(
    this._profile,
    this._profileRepository,
    this._cartRepository,
  );

  final Profile? _profile;
  final ProfileRepository _profileRepository;
  final CartRepository _cartRepository;

  Future<Cart> get() async {
    return _profile != null ? _profile!.cart : await _cartRepository.get();
  }

  Future<void> update(Cart cart) {
    return _profile != null
        ? _profileRepository.update(_profile!.copyWith(cart: cart))
        : _cartRepository.update(cart);
  }

  Future<void> clear() {
    return _profile != null
        ? _profileRepository.update(_profile!.copyWith(cart: const Cart()))
        : _cartRepository.clear();
  }
}

@Riverpod(keepAlive: true)
CartService cartService(CartServiceRef ref) {
  final profile = ref.watch(profileControllerProvider).valueOrNull;
  final profileRepository = ref.read(profileRepositoryProvider);
  final cartRepository = ref.read(cartRepositoryProvider);

  return CartService(profile, profileRepository, cartRepository);
}
