// =============================================================================
// File        : company_remote_data_source.dart
// Path        : lib/features/company/data/datasources/company_remote_data_source.dart
// Layer       : Data (Remote Datasource)
// -----------------------------------------------------------------------------
// Fungsi:
// - Handle remote CRUD company
// - Company berada di root collection
// - Mapping Firestore <-> CompanyModel
// =============================================================================

import 'package:app_laundry/core/network/base_remote_datasource.dart';

import 'package:app_laundry/features/company/data/models/company_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CompanyRemoteDataSource extends BaseRemoteDataSource {
  final FirebaseFirestore _firestore;

  CompanyRemoteDataSource(super.logger, {required FirebaseFirestore firestore})
    : _firestore = firestore;

  // =========================
  // COLLECTION
  // =========================

  CollectionReference<Map<String, dynamic>> get companiesRef {
    return _firestore.collection('companies');
  }

  // =========================
  // DOC REF
  // =========================

  DocumentReference<Map<String, dynamic>> docRef(String companyId) {
    return companiesRef.doc(companyId);
  }

  // =========================
  // GET COMPANY
  // =========================

  Future<CompanyModel?> getById(String companyId) {
    return safeCall(() async {
      final doc = await docRef(companyId).get();

      final data = doc.data();

      if (!doc.exists || data == null) {
        return null;
      }

      return CompanyModel.fromMap(data, doc.id);
    });
  }

  // =========================
  // STREAM COMPANY
  // =========================

  Stream<CompanyModel?> streamById(String companyId) {
    return safeStream(() {
      return docRef(companyId).snapshots().map((doc) {
        final data = doc.data();

        if (!doc.exists || data == null) {
          return null;
        }

        return CompanyModel.fromMap(data, doc.id);
      });
    });
  }

  // =========================
  // CREATE
  // =========================

  Future<void> create(CompanyModel company) {
    return safeCall(() async {
      await docRef(
        company.id,
      ).set({...company.toMap(), 'createdAt': FieldValue.serverTimestamp()});
    });
  }

  // =========================
  // UPDATE
  // =========================

  Future<void> update(CompanyModel company) {
    return safeCall(() async {
      await docRef(
        company.id,
      ).update({...company.toMap(), 'updatedAt': FieldValue.serverTimestamp()});
    });
  }

  // =========================
  // DELETE
  // =========================

  Future<void> delete(String companyId) {
    return safeCall(() async {
      await docRef(companyId).delete();
    });
  }
}
