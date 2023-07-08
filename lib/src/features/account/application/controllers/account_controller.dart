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
    return ref.watch(accountStreamProvider.future);
  }

  Future<void> logout() async {
    await ref.read(authRepositoryProvider).signOut();
    ref.read(routerProvider).go('/');
  }
}
