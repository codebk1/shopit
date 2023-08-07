import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/features/products/products.dart';

class ProductsFirestoreDataSource implements IProductsRemoteDataSource {
  const ProductsFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Product> get _productsRef =>
      _firestore.collection('products').withConverter(
            fromFirestore: (doc, _) => Product.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Product product, _) => product.toJson(),
          );

  @override
  Future<Product?> getById(String id) async {
    final snapshot = await _productsRef.doc(id).get();

    return snapshot.data();
  }

  @override
  Future<int> countByCategoryId(String id) async {
    final snapshot =
        await _productsRef.where('categoryId', isEqualTo: id).count().get();

    return snapshot.count;
  }

  @override
  Future<List<Product>> paginateByCategory(
    String id,
    String startAfter,
    int limit,
  ) async {
    final snapshot = await _productsRef
        .where('categoryId', isEqualTo: id)
        .orderBy('name')
        .startAfter([startAfter])
        .limit(limit)
        .get();

    return snapshot.docs.map((snapshot) => snapshot.data()).toList();
  }

  @override
  Future<List<Product>> featured() async {
    final snapshot =
        await _productsRef.where('featured', isEqualTo: true).get();

    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
}
