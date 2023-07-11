import 'package:shopit/src/features/account/domain/entities/account.dart';

abstract class AccountRepositoryInterface {
  Future<Account?> getAccount(String id);
  Stream<Account?> watchAccount(String id);
  Future<void> updateAccount(Account account);
}
