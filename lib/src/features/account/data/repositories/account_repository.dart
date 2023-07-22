import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/domain/datasources/account_remote_datasource.dart';
import 'package:shopit/src/features/account/data/datasources/account_firestore_datasource.dart';

part 'account_repository.g.dart';

class AccountRepository {
  const AccountRepository(this._remoteDataSource);

  final IAccountRemoteDataSource _remoteDataSource;

  Future<Account?> get(String userId) {
    return _remoteDataSource.get(userId);
  }

  Stream<Account?> watch(String userId) {
    return _remoteDataSource.watch(userId);
  }

  Future<void> update(Account account) async {
    return _remoteDataSource.update(account);
  }
}

@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) {
  final remoteDataSource = AccountFirestoreDataSource(
    FirebaseFirestore.instance,
  );

  return AccountRepository(remoteDataSource);
}
