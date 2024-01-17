import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/core/core.dart';
import 'package:shopit/src/common/common.dart';
import 'package:shopit/src/features/features.dart';

class CategoriesFirebaseDataSource implements ICategoriesRemoteDataSource {
  CategoriesFirebaseDataSource(this._firestore);

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
    try {
      final snapshot = await _categoriesRef.count().get();

      return snapshot.count ?? 0;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Category>> paginate(
    String startAfter,
    int limit,
    Sort sort,
  ) async {
    try {
      final query = _categoriesRef
          .orderBy(sort.column, descending: sort.descending)
          .limit(limit);

      final snapshot = startAfter.isNotEmpty
          ? await query.startAfter([startAfter]).get()
          : await query.get();

      return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Category>> featured() async {
    try {
      final snapshot =
          await _categoriesRef.where('featured', isEqualTo: true).get();

      return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<List<Category>> byIds(List<String> ids) async {
    try {
      final snapshot =
          await _categoriesRef.where(FieldPath.documentId, whereIn: ids).get();

      return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
