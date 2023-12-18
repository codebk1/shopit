import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

part 'checkout_repository.g.dart';

class CheckoutRepository {
  CheckoutRepository(
    this._localDataSource,
  );

  final ICheckoutLocalDataSource _localDataSource;

  Future<Checkout> get() async {
    return await _localDataSource.get() ?? const Checkout();
  }

  Future<void> update(Checkout checkout) {
    return _localDataSource.update(checkout);
  }

  Future<void> clear() {
    return _localDataSource.clear();
  }
}

@Riverpod(keepAlive: true)
CheckoutRepository checkoutRepository(CheckoutRepositoryRef ref) {
  final isar = ref.watch(isarProvider);
  final localDataSource = CheckoutIsarDataSource(isar);

  return CheckoutRepository(localDataSource);
}
