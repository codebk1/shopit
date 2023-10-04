import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:shopit/src/exceptions/exceptions.dart';
import 'package:shopit/src/features/profile/profile.dart';

class ProfileFirebaseDataSource implements IProfileRemoteDataSource {
  const ProfileFirebaseDataSource(
    this._firestore,
    this._storage,
  );

  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  CollectionReference<Profile> get _profilesRef =>
      _firestore.collection('profiles').withConverter(
            fromFirestore: (doc, _) => Profile.fromJson(
              doc.data()!..addAll({'id': doc.id}),
            ),
            toFirestore: (Profile profile, _) => profile.toJson(),
          );

  @override
  Future<Profile> get(String id) async {
    try {
      final snapshot = await _profilesRef.doc(id).get();
      final profile = snapshot.data();

      if (profile == null) {
        throw AppUnknownException();
      }

      return profile.copyWith(
        avatar: await getAvatar(id),
      );
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
  Future<Profile> update(Profile profile, bool updateAvatar) async {
    try {
      await _profilesRef.doc(profile.id).set(profile, SetOptions(merge: true));

      if (updateAvatar) {
        return profile.copyWith(
          avatar: await setAvatar(profile.avatar, profile.id),
        );
      }

      return profile;
    } catch (_) {
      throw AppUnknownException();
    }
  }

  @override
  Future<String?> getAvatar(String folder) async {
    try {
      final avatarRef = _storage.ref().child('users/$folder/avatar.jpg');

      return await avatarRef.getDownloadURL();
    } on FirebaseException catch (e) {
      if (e.code == 'object-not-found') return null;

      throw StorageException.fromCode(e.code);
    } catch (_) {
      throw StorageUnknownException();
    }
  }

  @override
  Future<String?> setAvatar(String? path, String folder) async {
    try {
      final avatarRef = _storage.ref().child('users/$folder/avatar.jpg');

      if (path == null) {
        await avatarRef.delete();
        return null;
      }

      final snapshot = await avatarRef.putFile(
        File(path),
        SettableMetadata(contentType: "image/jpeg"),
      );

      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw StorageException.fromCode(e.code);
    } catch (_) {
      throw StorageUnknownException();
    }
  }
}
