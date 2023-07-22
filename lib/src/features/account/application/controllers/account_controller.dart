import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/auth/application/controllers/auth_controller.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';

part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController {
  @override
  FutureOr<Account?> build() async {
    return await ref.watch(accountProvider.future);
  }

  Future<Account?> updateAccount(
    String email,
    String password,
    Account account,
  ) async {
    final authRepository = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.watch(accountRepositoryProvider).update(account);

      if (authRepository.currentUser!.email != email) {
        await authRepository.updateEmail(email);
      }

      if (password.isNotEmpty) {
        await authRepository.updatePassword(password);
      }

      return account;
    });

    if (!state.hasError) ref.watch(routerProvider).pop();

    return null;
  }
}

@riverpod
Future<Account?> account(AccountRef ref) async {
  final user = await ref.watch(authStateChangesProvider.future);

  return user != null
      ? ref.watch(accountRepositoryProvider).get(user.uid)
      : null;
}
