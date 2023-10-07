import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/addresses/addresses.dart';

class AddressesFirebaseDataSource implements IAddressesRemoteDataSource {
  const AddressesFirebaseDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Address> _addressesRef(String userId, AddressType type) =>
      _firestore
          .collection('addresses')
          .doc(userId)
          .collection(type.name)
          .withConverter(
            fromFirestore: (doc, _) => Address.fromJson(
              doc.data()!..addAll({'id': doc.id, 'type': type.name}),
            ),
            toFirestore: (Address address, _) => {
              ...address.toJson(),
              if (address.id == null) 'createdAt': FieldValue.serverTimestamp(),
            },
          );

  @override
  Future<Address?> getById(String userId, AddressType type, String id) async {
    try {
      final snapshot = await _addressesRef(userId, type).doc(id).get();

      return snapshot.data();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Address>> getByType(String userId, AddressType type) async {
    try {
      final snapshot =
          await _addressesRef(userId, type).orderBy('createdAt').get();

      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<String> add(String userId, Address address) async {
    try {
      final snapshot = await _addressesRef(userId, address.type).add(address);

      return snapshot.id;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<void> set(String userId, Address address) async {
    try {
      await _addressesRef(userId, address.type)
          .doc(address.id)
          .set(address, SetOptions(merge: true));
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<void> delete(String userId, Address address) async {
    try {
      await _addressesRef(userId, address.type).doc(address.id).delete();
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
