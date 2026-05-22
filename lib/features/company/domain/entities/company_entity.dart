// =============================================================================
// File        : company_entity.dart
// Path        : lib/features/company/domain/entities/company_entity.dart
// Layer       : Domain
// -----------------------------------------------------------------------------
// Fungsi:
// - Representasi data company pada domain layer
// =============================================================================

import 'package:flutter/material.dart';

class CompanyEntity {
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
  // SUBSCRIPTION
  // =========================

  final DateTime? activeUntil;

  // =========================
  // TIMESTAMP
  // =========================

  final DateTime? createdAt;

  final DateTime? updatedAt;

  const CompanyEntity({
    required this.id,

    required this.name,

    required this.email,

    required this.phone,

    required this.address,

    required this.currency,

    this.activeUntil,

    this.createdAt,

    this.updatedAt,
  });

  // =========================
  // GETTER
  // =========================

  bool get isActive {
    if (activeUntil == null) return false;
    return activeUntil!.isAfter(DateTime.now());
  }

  bool get isExpired => !isActive;

  // =========================
  // COPY WITH
  // =========================

  CompanyEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? address,
    String? currency,
    DateTime? activeUntil,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CompanyEntity(
      id: id ?? this.id,

      name: name ?? this.name,

      email: email ?? this.email,

      phone: phone ?? this.phone,

      address: address ?? this.address,

      currency: currency ?? this.currency,

      activeUntil: activeUntil ?? this.activeUntil,

      createdAt: createdAt ?? this.createdAt,

      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
