import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/features/cart/cart.dart';

class CartFirebaseDataSource implements ICartRemoteDataSource {
  const CartFirebaseDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Cart> get _cartsRef =>
      _firestore.collection('carts').withConverter(
            fromFirestore: (doc, _) => Cart.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Cart cart, _) => cart.toJson(),
          );

  @override
  Future<Cart> get(String id) async {
    final cart = await _cartsRef
        .where('userId', isEqualTo: id)
        .where('state', isEqualTo: CartState.active.name)
        .get();

    if (cart.docs.isEmpty) {
      final cart = Cart(userId: id);
      final doc = await _cartsRef.add(cart);

      return cart.copyWith(id: doc.id);
    }

    return cart.docs.first.data();
  }

  @override
  Future<void> update(Cart cart) {
    return _cartsRef.doc(cart.id).set(cart);
  }

  @override
  Future<void> clear(Cart cart) {
    return _cartsRef.doc(cart.id).set(
          cart.copyWith(state: CartState.abandoned),
          SetOptions(merge: true),
        );
  }
}
