import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_remote_datasource.dart';

abstract class BaseCrudRemoteDataSource<T> extends BaseRemoteDataSource {
  final FirebaseFirestore firestore;

  BaseCrudRemoteDataSource(this.firestore);

  /// 🔹 Collection name wajib di-override
  String get collection;

  /// 🔹 Mapper wajib di-override
  T fromMap(Map<String, dynamic> map, String id);

  Map<String, dynamic> toMap(T data);

  /// ===============================
  /// CREATE
  /// ===============================
  Future<void> create(String id, T data) {
    return safeCall(() async {
      await firestore.collection(collection).doc(id).set(toMap(data));
    });
  }

  /// ===============================
  /// READ (single)
  /// ===============================
  Future<T> getById(String id) {
    return safeCall(() async {
      final doc = await firestore.collection(collection).doc(id).get();
      final data = doc.data()!;
      return fromMap(data, doc.id);
    });
  }

  /// ===============================
  /// READ (list)
  /// ===============================
  Future<List<T>> getAll() {
    return safeCall(() async {
      final snapshot = await firestore.collection(collection).get();

      return snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)).toList();
    });
  }

  /// ===============================
  /// UPDATE
  /// ===============================
  Future<void> update(String id, T data) {
    return safeCall(() async {
      await firestore.collection(collection).doc(id).update(toMap(data));
    });
  }

  /// ===============================
  /// DELETE
  /// ===============================
  Future<void> delete(String id) {
    return safeCall(() async {
      await firestore.collection(collection).doc(id).delete();
    });
  }

  /// ===============================
  /// 🔥 STREAM ALL
  /// ===============================
  Stream<List<T>> streamAll() {
    return safeStream(() {
      return firestore.collection(collection).snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)).toList();
      });
    });
  }

  /// ===============================
  /// 🔥 STREAM BY FIELD
  /// ===============================
  Stream<List<T>> streamWhere({
    required String field,
    required dynamic isEqualTo,
  }) {
    return safeStream(() {
      return firestore
          .collection(collection)
          .where(field, isEqualTo: isEqualTo)
          .snapshots()
          .map((snapshot) {
            return snapshot.docs
                .map((doc) => fromMap(doc.data(), doc.id))
                .toList();
          });
    });
  }
}
