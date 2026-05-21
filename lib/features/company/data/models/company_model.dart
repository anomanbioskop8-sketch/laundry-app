// =============================================================================
// File        : company_model.dart
// Path        : lib/features/company/data/models/company_model.dart
// Layer       : Data (Model)
// -----------------------------------------------------------------------------
// Fungsi:
// - Model representasi company dari Firestore
// - Mapping Firestore <-> Entity
// =============================================================================

import 'package:app_laundry/core/extensions/timestamp_ext.dart';

class CompanyModel {
  // =========================
  // IDENTITY
  // =========================

  final String id;

  final String name;

  // =========================
  // CONTACT
  // =========================

  final String email;

  final String phone;

  final String address;

  // =========================
  // SETTINGS
  // =========================

  final String currency;

  // =========================
  // TIMESTAMP
  // =========================

  final DateTime? createdAt;

  final DateTime? updatedAt;

  const CompanyModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.currency,
    this.createdAt,
    this.updatedAt,
  });

  // =========================
  // FROM MAP
  // =========================

  factory CompanyModel.fromMap(Map<String, dynamic> map, String id) {
    return CompanyModel(
      id: id,

      name: map['name'] ?? '',

      email: map['email'] ?? '',

      phone: map['phone'] ?? '',

      address: map['address'] ?? '',

      currency: map['currency'] ?? 'IDR',

      createdAt: map.timestamp('createdAt'),

      updatedAt: map.timestamp('updatedAt'),
    );
  }

  // =========================
  // TO MAP
  // =========================

  Map<String, dynamic> toMap() {
    return {
      'name': name,

      'email': email,

      'phone': phone,

      'address': address,

      'currency': currency,
    };
  }

  // =========================
  // COPY WITH
  // =========================

  CompanyModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? currency,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CompanyModel(
      id: id ?? this.id,

      name: name ?? this.name,

      email: email ?? this.email,

      phone: phone ?? this.phone,

      address: address ?? this.address,

      currency: currency ?? this.currency,

      createdAt: createdAt ?? this.createdAt,

      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
