import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/features/categories/domain/entities/category.dart';
import 'package:shopit/src/features/categories/domain/datasources/categories_remote_datasource.dart';

class CategoriesFirestoreDataSource implements ICategoriesRemoteDataSource {
  CategoriesFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  Query<Category> get _categoriesRef =>
      _firestore.collection('categories').withConverter(
            fromFirestore: (doc, _) => Category.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Category category, _) => category.toJson(),
          );

  @override
  Future<int> count() async {
    final snapshot = await _categoriesRef.count().get();

    return snapshot.count;
  }

  @override
  Future<List<Category>> paginate(String startAfter, int limit) async {
    final snapshot = await _categoriesRef
        .orderBy('name')
        .startAfter([startAfter])
        .limit(limit)
        .get();

    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  @override
  Future<List<Category>> featured() async {
    final snapshot =
        await _categoriesRef.where('featured', isEqualTo: true).get();

    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  @override
  Future<List<Category>> byIds(List<String> ids) async {
    final snapshot =
        await _categoriesRef.where(FieldPath.documentId, whereIn: ids).get();

    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
}
