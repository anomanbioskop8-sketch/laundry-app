// =============================================================================
// File        : setting_remote_data_source.dart
// Path        : lib/features/setting/data/datasources/setting_remote_data_source.dart
// Layer       : Data (Remote Datasource)
// -----------------------------------------------------------------------------
// Fungsi:
// - Handle remote setting app
// - Setting disimpan sebagai singleton document
// =============================================================================

import 'package:app_laundry/core/network/base_remote_datasource.dart';
import 'package:app_laundry/features/setting/data/models/setting_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingRemoteDataSource extends BaseRemoteDataSource {
  // =========================
  // DEPENDENCY
  // =========================

  final FirebaseFirestore _firestore;

  SettingRemoteDataSource(super.logger, {required FirebaseFirestore firestore})
    : _firestore = firestore;

  // =========================
  // DOCUMENT REFERENCE
  // =========================

  DocumentReference<Map<String, dynamic>> _docRef(String companyId) {
    return _firestore
        .collection('companies')
        .doc(companyId)
        .collection('settings')
        .doc('general');
  }

  // =========================
  // STREAM
  // =========================

  Stream<SettingModel?> stream(String companyId) {
    return safeStream(() {
      return _docRef(companyId).snapshots().map((doc) {
        final data = doc.data();

        if (!doc.exists || data == null) {
          return null;
        }

        return SettingModel.fromMap(data, doc.id);
      });
    });
  }

  // =========================
  // GET
  // =========================

  Future<SettingModel?> get(String companyId) {
    return safeCall(() async {
      final doc = await _docRef(companyId).get();

      final data = doc.data();

      if (!doc.exists || data == null) {
        return null;
      }

      return SettingModel.fromMap(data, doc.id);
    });
  }

  // =========================
  // CREATE
  // =========================

  Future<void> create({
    required String companyId,
    required SettingModel setting,
  }) {
    return safeCall(() async {
      await _docRef(
        companyId,
      ).set({...setting.toMap(), 'createdAt': FieldValue.serverTimestamp()});
    });
  }

  // =========================
  // UPDATE
  // =========================

  Future<void> update({
    required String companyId,
    required SettingModel setting,
  }) {
    return safeCall(() async {
      await _docRef(
        companyId,
      ).update({...setting.toMap(), 'updatedAt': FieldValue.serverTimestamp()});
    });
  }
}
