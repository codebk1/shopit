import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/auth.dart';
import 'package:shopit/src/features/profile/profile.dart';
import 'package:shopit/src/features/checkout/checkout.dart';

part 'checkout_service.g.dart';

class CheckoutService {
  const CheckoutService(
    this._user,
    this._profileController,
    this._checkoutRepository,
  );

  final User? _user;
  final ProfileController _profileController;
  final CheckoutRepository _checkoutRepository;

  Future<Checkout> get() async {
    final profile = await _profileController.future;

    return profile != null ? profile.checkout : await _checkoutRepository.get();
  }

  Future<void> update(Checkout checkout) {
    return _user != null
        ? _profileController.setCheckout(checkout)
        : _checkoutRepository.update(checkout);
  }

  Future<void> clear() {
    return _user != null
        ? _profileController.setCheckout(const Checkout())
        : _checkoutRepository.clear();
  }
}

@Riverpod(keepAlive: true)
CheckoutService checkoutService(CheckoutServiceRef ref) {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  final profileController = ref.read(profileControllerProvider.notifier);
  final checkoutRepository = ref.read(checkoutRepositoryProvider);

  return CheckoutService(user, profileController, checkoutRepository);
}
