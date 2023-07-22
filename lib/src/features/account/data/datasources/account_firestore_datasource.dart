import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/features/account/domain/entities/account.dart';
import 'package:shopit/src/features/account/domain/datasources/account_remote_datasource.dart';

class AccountFirestoreDataSource implements IAccountRemoteDataSource {
  const AccountFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Account> get _accountsRef =>
      _firestore.collection('accounts').withConverter(
            fromFirestore: (doc, _) => Account.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Account account, _) => account.toJson(),
          );

  @override
  Future<Account?> get(String id) async {
    final snapshot = await _accountsRef.doc(id).get();

    return snapshot.data();
  }

  @override
  Stream<Account?> watch(String id) {
    return _accountsRef.doc(id).snapshots().map((snapshot) => snapshot.data());
  }

  @override
  Future<void> update(Account account) {
    return _accountsRef.doc(account.id).set(account, SetOptions(merge: true));
  }
}
