// =============================================================================
// File        : base_crud_remote_datasource.dart
// Path        : lib/core/network/datasources/base_crud_remote_datasource.dart
// =============================================================================

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_laundry/core/network/base_remote_datasource.dart';
import 'package:flutter/material.dart';

abstract class BaseCrudRemoteDataSource<T> extends BaseRemoteDataSource {
  final FirebaseFirestore _firestore;

  BaseCrudRemoteDataSource(super.logger, {required FirebaseFirestore firestore})
    : _firestore = firestore;

  // protected access
  @protected
  FirebaseFirestore get firestore => _firestore;

  // =========================
  // CONTRACT
  // =========================

  String get collection;

  T fromMap(Map<String, dynamic> map, String id);

  Map<String, dynamic> toMap(T data);

  // =========================
  // COLLECTION
  // =========================

  CollectionReference<Map<String, dynamic>> collectionRef(String companyId) {
    return _firestore
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

  Future<List<T>> getByIds({
    required String companyId,
    required List<String> ids,
  }) {
    return safeCall(() async {
      if (ids.isEmpty) return [];

      final result = <T>[];

      const chunkSize = 10;

      for (var i = 0; i < ids.length; i += chunkSize) {
        final chunk = ids.skip(i).take(chunkSize).toList();

        final snapshot = await collectionRef(
          companyId,
        ).where(FieldPath.documentId, whereIn: chunk).get();

        result.addAll(snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)));
      }

      return result;
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
