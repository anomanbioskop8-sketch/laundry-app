// =============================================================================
// File        : base_crud_remote_datasource.dart
// Path        : lib/core/network/datasources/base_crud_remote_datasource.dart
// Layer       : Core (Data)
// -----------------------------------------------------------------------------
// Fungsi:
// - Abstraksi CRUD untuk Firestore berbasis multi-tenant (companyId)
// - Menyediakan operasi standar: create, update, delete, get, stream
// =============================================================================

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_laundry/core/network/base_remote_datasource.dart';

abstract class BaseCrudRemoteDataSource<T> extends BaseRemoteDataSource {
  final FirebaseFirestore firestore;

  BaseCrudRemoteDataSource(super.logger, {required this.firestore});

  // =========================
  // CONTRACT
  // =========================

  String get collection;
  T fromMap(Map<String, dynamic> map, String id);
  Map<String, dynamic> toMap(T data);

  // =========================
  // COLLECTION REFERENCE
  // =========================

  CollectionReference<Map<String, dynamic>> collectionRef(String companyId) {
    return firestore
        .collection('companies')
        .doc(companyId)
        .collection(collection);
  }

  DocumentReference<Map<String, dynamic>> docRef(String companyId, String id) {
    return collectionRef(companyId).doc(id);
  }

  // =========================
  // STREAM ALL
  // =========================

  Stream<List<T>> streamAll(
    String companyId, {
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)?
    queryBuilder,
  }) {
    return safeStream(() {
      Query<Map<String, dynamic>> query = collectionRef(companyId);

      /// Optional query customization
      if (queryBuilder != null) {
        query = queryBuilder(query);
      }

      return query.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return fromMap(doc.data(), doc.id);
        }).toList();
      });
    });
  }

  // =========================
  // GET BY ID
  // =========================

  Future<T?> getById({required String companyId, required String id}) {
    return safeCall(() async {
      final doc = await docRef(companyId, id).get();

      final data = doc.data();

      if (!doc.exists || data == null) {
        return null;
      }

      return fromMap(data, doc.id);
    });
  }

  // =========================
  // CREATE
  // =========================

  Future<void> create({
    required String companyId,
    required String id,
    required T data,
  }) {
    return safeCall(() async {
      await docRef(companyId, id).set({
        ...toMap(data),
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    });
  }

  // =========================
  // UPDATE
  // =========================

  Future<void> update({
    required String companyId,
    required String id,
    required T data,
  }) {
    return safeCall(() async {
      await docRef(
        companyId,
        id,
      ).update({...toMap(data), 'updatedAt': FieldValue.serverTimestamp()});
    });
  }

  // =========================
  // DELETE
  // =========================

  Future<void> delete({required String companyId, required String id}) {
    return safeCall(() async {
      await docRef(companyId, id).delete();
    });
  }
}
