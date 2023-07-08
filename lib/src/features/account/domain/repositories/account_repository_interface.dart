import 'package:shopit/src/features/account/domain/entities/account.dart';

abstract class AccountRepositoryInterface {
  Stream<Account?> watchAccount(String id);

  Future<void> updateAccount(Account account);
}
