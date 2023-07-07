import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<User?> build() {
    return ref.watch(authStateChangesProvider).value;
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final credentials =
          await authRepository.signInWithEmailAndPassword(email, password);

      return credentials.user;
    });

    if (state.hasError == false) {
      ref.read(routerProvider).go('/account');
    }
  }

  Future<void> signup({
    required String email,
    required String password,
    required Account account,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    final accountRepository = ref.read(accountRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final credentials = await authRepository.createUserWithEmailAndPassword(
        email,
        password,
      );

      await accountRepository.updateAccount(account);

      return credentials.user;
    });
  }
}
