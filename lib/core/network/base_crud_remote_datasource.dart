import 'package:app_laundry/core/network/base_remote_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseCrudRemoteDataSource<T> extends BaseRemoteDataSource {
  final FirebaseFirestore firestore;

  BaseCrudRemoteDataSource(super.logger, {required this.firestore});

  /// =========================
  /// CONTRACT
  /// =========================
  String get collection;

  T fromMap(Map<String, dynamic> map, String id);

  Map<String, dynamic> toMap(T data);

  /// =========================
  /// REF BUILDER
  /// =========================
  CollectionReference<Map<String, dynamic>> _ref(String companyId) {
    return firestore
        .collection('companies')
        .doc(companyId)
        .collection(collection);
  }

  /// =========================
  /// CREATE
  /// =========================
  Future<void> create({
    required String companyId,
    required String id,
    required T data,
  }) {
    return safeCall(() async {
      await _ref(companyId).doc(id).set({
        ...toMap(data),
        'createdAt': FieldValue.serverTimestamp(),
      });
    });
  }

  /// =========================
  /// UPDATE
  /// =========================
  Future<void> update({
    required String companyId,
    required String id,
    required T data,
  }) {
    return safeCall(() async {
      await _ref(companyId).doc(id).update({
        ...toMap(data),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    });
  }

  /// =========================
  /// DELETE
  /// =========================
  Future<void> delete({required String companyId, required String id}) {
    return safeCall(() async {
      await _ref(companyId).doc(id).delete();
    });
  }

  /// =========================
  /// GET SINGLE
  /// =========================
  Future<T?> getById({required String companyId, required String id}) {
    return safeCall(() async {
      final doc = await _ref(companyId).doc(id).get();

      if (!doc.exists || doc.data() == null) return null;

      return fromMap(doc.data()!, doc.id);
    });
  }

  /// =========================
  /// STREAM ALL
  /// =========================
  Stream<List<T>> streamAll(String companyId) {
    return safeStream(() {
      return _ref(companyId).snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)).toList();
      });
    });
  }
}
