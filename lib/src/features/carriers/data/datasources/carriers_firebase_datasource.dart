import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/carriers/carriers.dart';

class CarriersFirebaseDataSource implements ICarriersRemoteDataSource {
  const CarriersFirebaseDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Carrier> get _carriersRef =>
      _firestore.collection('carriers').withConverter(
            fromFirestore: (doc, _) => Carrier.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Carrier carrier, _) => carrier.toJson(),
          );

  @override
  Future<List<Carrier>> get() async {
    try {
      final snapshot = await _carriersRef.get();

      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Carrier?> getById(String id) async {
    try {
      final snapshot = await _carriersRef.doc(id).get();

      return snapshot.data();
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
