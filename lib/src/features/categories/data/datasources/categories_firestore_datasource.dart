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
  Future<int> getCategoriesCount() async {
    final snapshot = await _categoriesRef.count().get();
    return snapshot.count;
  }

  @override
  Future<List<Category>> getCategories(String startAfter, int limit) async {
    final categories = await _categoriesRef
        .orderBy('name')
        .startAfter([startAfter])
        .limit(limit)
        .get();

    return categories.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
}
