import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/router/router.dart';
import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/data/repositories/account_repository.dart';

part 'edit_account_controller.g.dart';

@riverpod
class EditAccountController extends _$EditAccountController {
  @override
  FutureOr<void> build() async {}

  Future<void> updateAccount(
    User user,
    String newEmail,
    String newPassword,
    Account account,
  ) async {
    final authRepository = ref.read(authRepositoryProvider);
    final accountRepository = ref.read(accountRepositoryProvider);

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await accountRepository.updateAccount(account);

      if (user.email != newEmail) {
        await authRepository.updateEmail(newEmail);
      }

      if (newPassword.isNotEmpty) {
        await authRepository.updatePassword(newPassword);
      }
    });

    if (!state.hasError) ref.read(routerProvider).pop();
  }
}
