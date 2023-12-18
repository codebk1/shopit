import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class ProductsFirebaseDataSource implements IProductsRemoteDataSource {
  const ProductsFirebaseDataSource(this._firestore);

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
    try {
      final snapshot = await _productsRef.doc(id).get();

      return snapshot.data();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<int> countByCategoryId(String id) async {
    try {
      final snapshot =
          await _productsRef.where('categoryId', isEqualTo: id).count().get();

      return snapshot.count;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Product>> paginateByCategory(
    String id,
    Product? startAfter,
    int limit,
    Sort sort,
  ) async {
    try {
      final sortByUniqueField = sort.column == 'name';

      final query = _productsRef
          .where('categoryId', isEqualTo: id)
          .orderBy(sort.column, descending: sort.descending)
          .orderBy(sortByUniqueField ? FieldPath.documentId : 'name')
          .limit(limit);

      final snapshot = startAfter != null
          ? await query.startAfter([
              startAfter.toJson()[sort.column],
              if (!sortByUniqueField) startAfter.name
            ]).get()
          : await query.get();

      return snapshot.docs.map((snapshot) => snapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Product>> featured() async {
    try {
      final snapshot =
          await _productsRef.where('featured', isEqualTo: true).get();

      return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
