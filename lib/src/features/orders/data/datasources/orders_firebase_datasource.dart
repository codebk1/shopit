import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/features/features.dart';

class OrdersFirebaseDataSource implements IOrdersRemoteDataSource {
  const OrdersFirebaseDataSource(this._firestore);

  final firestore.FirebaseFirestore _firestore;

  firestore.CollectionReference<Order> _ordersRef([String? uid]) => _firestore
      .collection('profiles')
      .doc(uid)
      .collection('orders')
      .withConverter(
        fromFirestore: (doc, _) {
          final data = doc.data()!;

          data.addAll({
            'id': doc.id,
            'createdAt': data['createdAt'].toDate().toString(),
            'updatedAt': data['updatedAt'].toDate().toString(),
          });

          return Order.fromJson(data);
        },
        toFirestore: (Order order, _) => {
          ...order.toJson(),
          if (order.id == null)
            'createdAt': firestore.FieldValue.serverTimestamp(),
          'updatedAt': firestore.FieldValue.serverTimestamp(),
        },
      );

  @override
  Future<List<Order>> get(String uid) async {
    try {
      final snapshot =
          await _ordersRef(uid).orderBy('createdAt', descending: true).get();

      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Order?> byId(String uid, String id) async {
    try {
      final snapshot = await _ordersRef(uid).doc(id).get();

      return snapshot.data();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<Order?> latest(String uid) async {
    try {
      final snapshot = await _ordersRef(uid)
          .orderBy('createdAt', descending: true)
          .limit(1)
          .get();

      return snapshot.docs[0].data();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<int> count(String uid) async {
    try {
      final snapshot = await _ordersRef(uid).count().get();

      return snapshot.count;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<String> add(String uid, Order order) async {
    try {
      return await _firestore.runTransaction((transaction) async {
        final docRef = _ordersRef(uid).doc();
        final configRef = _firestore.collection('config').doc('orders');

        final config = await transaction.get(configRef);
        final orderNumber = config.get('lastNumber') + 1;

        transaction.set(
          docRef,
          order.copyWith(number: orderNumber),
        );

        transaction.set(
          configRef,
          {'lastNumber': orderNumber},
        );

        return docRef.id;
      });
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
