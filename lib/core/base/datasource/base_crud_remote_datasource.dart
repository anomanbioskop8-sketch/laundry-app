import 'package:cloud_firestore/cloud_firestore.dart';

import '../../error/exceptions.dart';
import 'base_remote_datasource.dart';

abstract class BaseCrudRemoteDataSource<T> extends BaseRemoteDataSource {
  final FirebaseFirestore firestore;

  BaseCrudRemoteDataSource(this.firestore);

  /// 🔹 Collection name wajib di-override
  String get collection;

  /// 🔹 Mapper wajib di-override
  T fromMap(Map<String, dynamic> map, String id);

  Map<String, dynamic> toMap(T data);

  CollectionReference<Map<String, dynamic>> get _ref =>
      firestore.collection(collection);

  /// ===============================
  /// CREATE
  /// ===============================
  Future<void> create(String id, T data) {
    return safeCall(() async {
      await _ref.doc(id).set(toMap(data));
    });
  }

  /// ===============================
  /// READ (single)
  /// ===============================
  Future<T> getById(String id) {
    return safeCall(() async {
      final doc = await _ref.doc(id).get();

      if (!doc.exists) {
        throw const NotFoundException('Data tidak ditemukan');
      }

      final data = doc.data();

      if (data == null) {
        throw const ServerException('Data kosong');
      }

      return fromMap(data, doc.id);
    });
  }

  /// ===============================
  /// READ (list)
  /// ===============================
  Future<List<T>> getAll() {
    return safeCall(() async {
      final snapshot = await _ref.get();

      return snapshot.docs
          .map((doc) {
            final data = doc.data();

            if (data.isEmpty) return null;

            try {
              return fromMap(data, doc.id);
            } catch (_) {
              return null; // skip data rusak
            }
          })
          .whereType<T>()
          .toList();
    });
  }

  /// ===============================
  /// UPDATE
  /// ===============================
  Future<void> update(String id, T data) {
    return safeCall(() async {
      final doc = await _ref.doc(id).get();

      if (!doc.exists) {
        throw const NotFoundException('Data tidak ditemukan');
      }

      await _ref.doc(id).update(toMap(data));
    });
  }

  /// ===============================
  /// DELETE
  /// ===============================
  Future<void> delete(String id) {
    return safeCall(() async {
      final doc = await _ref.doc(id).get();

      if (!doc.exists) {
        throw const NotFoundException('Data tidak ditemukan');
      }

      await _ref.doc(id).delete();
    });
  }

  /// ===============================
  /// 🔥 STREAM ALL
  /// ===============================
  Stream<List<T>> streamAll() {
    return safeStream(() {
      return _ref.snapshots().map((snapshot) {
        return snapshot.docs
            .map((doc) {
              try {
                return fromMap(doc.data(), doc.id);
              } catch (_) {
                return null;
              }
            })
            .whereType<T>()
            .toList();
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
      return _ref.where(field, isEqualTo: isEqualTo).snapshots().map((
        snapshot,
      ) {
        return snapshot.docs
            .map((doc) {
              try {
                return fromMap(doc.data(), doc.id);
              } catch (_) {
                return null;
              }
            })
            .whereType<T>()
            .toList();
      });
    });
  }
}
