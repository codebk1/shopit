import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';

part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController {
  @override
  FutureOr<Account?> build() async {
    final user = ref.watch(authStateChangesProvider).value;

    if (user != null) {
      return ref.read(accountRepositoryProvider).getAccount(user.uid);
    }

    return null;
  }

  Future<Account?> updateAccount(
    String newEmail,
    String newPassword,
    Account account,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);
    final accountRepository = ref.read(accountRepositoryProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await accountRepository.updateAccount(account);

      if (authRepository.currentUser!.email != newEmail) {
        await authRepository.updateEmail(newEmail);
      }

      if (newPassword.isNotEmpty) {
        await authRepository.updatePassword(newPassword);
      }

      return account;
    });

    if (!state.hasError) ref.read(routerProvider).pop();

    return null;
  }
}
