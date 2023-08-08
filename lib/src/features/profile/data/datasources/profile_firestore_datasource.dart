import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/profile/profile.dart';

class ProfileFirestoreDataSource implements IProfileRemoteDataSource {
  const ProfileFirestoreDataSource(this._firestore);

  final FirebaseFirestore _firestore;

  static const _collection = 'profiles';

  CollectionReference<Profile> get _profilesRef =>
      _firestore.collection(_collection).withConverter(
            fromFirestore: (doc, _) => Profile.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Profile profile, _) => profile.toJson()..remove('id'),
          );

  @override
  Future<Profile> get(String id) async {
    try {
      final snapshot = await _profilesRef.doc(id).get();
      final data = snapshot.data();

      if (data == null) {
        throw AppUnknownException();
      }

      return data;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Stream<Profile?> watch(String id) {
    return _profilesRef
        .doc(id)
        .snapshots()
        .map((snapshot) => snapshot.data())
        .handleError(throw AppUnknownException());
  }

  @override
  Future<void> update(Profile profile) async {
    try {
      await _profilesRef.doc(profile.id).set(profile, SetOptions(merge: true));
    } catch (_) {
      throw AppUnknownException();
    }
  }
}
