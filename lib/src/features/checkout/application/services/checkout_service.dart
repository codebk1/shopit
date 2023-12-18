import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/features.dart';

part 'checkout_service.g.dart';

class CheckoutService {
  const CheckoutService(
    this._profile,
    this._profileController,
    this._checkoutRepository,
  );

  final Profile? _profile;
  final ProfileController _profileController;
  final CheckoutRepository _checkoutRepository;

  Future<Checkout> get() async {
    return _profile != null
        ? _profile.checkout
        : await _checkoutRepository.get();
  }

  Future<void> update(Checkout checkout) {
    return _profile != null
        ? _profileController.setCheckout(checkout)
        : _checkoutRepository.update(checkout);
  }

  Future<void> clear() {
    return _profile != null
        ? _profileController.setCheckout(const Checkout())
        : _checkoutRepository.clear();
  }
}

@Riverpod(keepAlive: true)
CheckoutService checkoutService(CheckoutServiceRef ref) {
  final profile = ref.watch(profileProvider).valueOrNull;
  final profileController = ref.read(profileControllerProvider.notifier);
  final checkoutRepository = ref.read(checkoutRepositoryProvider);

  return CheckoutService(profile, profileController, checkoutRepository);
}
