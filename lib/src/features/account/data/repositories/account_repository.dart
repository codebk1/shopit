import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/auth/data/repositories/auth_repository.dart';
import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/domain/repositories/account_repository_interface.dart';
import 'package:shopit/src/features/account/data/datasources/remote/account_remote_datasource.dart';

part 'account_repository.g.dart';

class AccountRepository implements AccountRepositoryInterface {
  const AccountRepository(this._remoteDataSource);

  final AccountRemoteDataSource _remoteDataSource;

  @override
  Future<Account?> getAccount(String userId) {
    return _remoteDataSource.getAccount(userId);
  }

  @override
  Stream<Account?> watchAccount(String userId) {
    return _remoteDataSource.watchAccount(userId);
  }

  @override
  Future<void> updateAccount(Account account) async {
    return _remoteDataSource.updateAccount(account);
  }
}

@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) {
  final remoteDataSource = AccountRemoteDataSource(FirebaseFirestore.instance);

  return AccountRepository(remoteDataSource);
}

// @riverpod
// Future<Account?> account(AccountRef ref) async {
//   final user = ref.watch(authStateChangesProvider).value;

//   if (user != null) {
//     return ref.read(accountRepositoryProvider).getAccount(user.uid);
//   }

//   return null;
// }
