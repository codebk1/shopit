import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/features/account/domain/entities/account.dart';

class AccountRemoteDataSource {
  const AccountRemoteDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Account> _accountsRef() =>
      _firestore.collection('accounts').withConverter(
            fromFirestore: (doc, _) => Account.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Account account, _) => account.toJson(),
          );

  Future<Account?> getAccount(String id) async {
    final account = await _accountsRef().doc(id).get();

    return account.data();
  }

  Stream<Account?> watchAccount(String id) {
    return _accountsRef()
        .doc(id)
        .snapshots()
        .map((snapshot) => snapshot.data());
  }

  Future<void> updateAccount(Account account) {
    return _accountsRef().doc(account.id).set(account, SetOptions(merge: true));
  }
}
