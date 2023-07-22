import 'package:shopit/src/features/account/domain/entities/account.dart';

abstract class IAccountRemoteDataSource {
  Future<Account?> get(String id);
  Stream<Account?> watch(String id);
  Future<void> update(Account account);
}
