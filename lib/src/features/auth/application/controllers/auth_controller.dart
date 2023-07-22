import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/cart/data/repositories/cart_local_repository.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';
import 'package:shopit/src/features/wishlist/data/repositories/wishlist_repository.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.watch(authRepositoryProvider);
    final cartLocalRepository = ref.watch(cartLocalRepositoryProvider);
    final wishlistRepository = ref.watch(wishlistRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authRepository.signInWithEmailAndPassword(email, password),
    );

    if (!state.hasError) {
      await cartLocalRepository.clear();
      await wishlistRepository.clear();
      ref.watch(routerProvider).goNamed('account');
    }
  }

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final authRepository = ref.watch(authRepositoryProvider);
    final accountRepository = ref.watch(accountRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final credentials = await authRepository.createUserWithEmailAndPassword(
        email,
        password,
      );

      final account = Account(
        id: credentials.user!.uid,
        firstName: firstName,
        lastName: lastName,
      );

      accountRepository.update(account);
    });

    if (!state.hasError) {
      ref.watch(routerProvider).goNamed('account');
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.watch(authRepositoryProvider).signOut(),
    );

    if (!state.hasError) ref.watch(routerProvider).go('/');
  }
}

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
}
