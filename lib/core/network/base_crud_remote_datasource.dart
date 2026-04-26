import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/session/cubit/session_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'base_remote_datasource.dart';

abstract class BaseCrudRemoteDataSource<T> extends BaseRemoteDataSource {
  final FirebaseFirestore firestore;
  final SessionCubit session;

  BaseCrudRemoteDataSource(
    super.logger, {
    required this.firestore,
    required this.session,
  });

  /// =========================
  /// CONTRACT
  /// =========================
  String get collection;

  T fromMap(Map<String, dynamic> map, String id);

  Map<String, dynamic> toMap(T data);

  /// =========================
  /// SAFE COMPANY ID
  /// =========================
  String get _companyId => session.companyId;

  /// =========================
  /// COLLECTION REFERENCE (AUTO SCOPE)
  /// =========================
  CollectionReference<Map<String, dynamic>> get _ref =>
      firestore.collection('companies').doc(_companyId).collection(collection);

  /// =========================
  /// CREATE
  /// =========================
  Future<void> create({required String id, required T data}) {
    return safeCall(() async {
      await _ref.doc(id).set({
        ...toMap(data),
        'createdAt': FieldValue.serverTimestamp(),
      });
    });
  }

  /// =========================
  /// UPDATE
  /// =========================
  Future<void> update({required String id, required T data}) {
    return safeCall(() async {
      await _ref.doc(id).update({
        ...toMap(data),
        'updatedAt': FieldValue.serverTimestamp(),
      });
    });
  }

  /// =========================
  /// DELETE
  /// =========================
  Future<void> delete({required String id}) {
    return safeCall(() async {
      await _ref.doc(id).delete();
    });
  }

  /// =========================
  /// GET SINGLE
  /// =========================
  Future<T?> getById({required String id}) {
    return safeCall(() async {
      final doc = await _ref.doc(id).get();

      if (!doc.exists) return null;

      return fromMap(doc.data()!, doc.id);
    });
  }

  /// =========================
  /// STREAM ALL
  /// =========================
  Stream<List<T>> streamAll() {
    return safeStream(() {
      return _ref.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)).toList();
      });
    });
  }
}
