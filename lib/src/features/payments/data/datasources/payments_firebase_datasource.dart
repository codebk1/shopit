import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/payments/payments.dart';

class PaymentsFirebaseDataSource implements IPaymentsRemoteDataSource {
  const PaymentsFirebaseDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Payment> get _paymentsRef =>
      _firestore.collection('payments').withConverter(
            fromFirestore: (doc, _) => Payment.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Payment payment, _) => payment.toJson(),
          );

  @override
  Future<List<Payment>> get() async {
    try {
      final snapshot = await _paymentsRef.get();

      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Payment?> getById(String id) async {
    try {
      final snapshot = await _paymentsRef.doc(id).get();

      return snapshot.data();
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
