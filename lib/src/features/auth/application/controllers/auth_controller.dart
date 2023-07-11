import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => authRepository.signInWithEmailAndPassword(email, password),
    );

    if (!state.hasError) ref.read(routerProvider).go('/account');
  }

  Future<void> signup({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final authRepository = ref.read(authRepositoryProvider);
    final accountRepository = ref.read(accountRepositoryProvider);

    state = const AsyncValue.loading();
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

      accountRepository.updateAccount(account);
    });
  }

  Future<void> logout() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signOut(),
    );

    if (!state.hasError) ref.read(routerProvider).go('/');
  }
}
