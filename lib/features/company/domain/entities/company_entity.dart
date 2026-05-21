// =============================================================================
// File        : company_entity.dart
// Path        : lib/features/company/domain/entities/company_entity.dart
// Layer       : Domain
// -----------------------------------------------------------------------------
// Fungsi:
// - Representasi data company pada domain layer
// =============================================================================

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

    this.createdAt,

    this.updatedAt,
  });

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
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CompanyEntity(
      id: id ?? this.id,

      name: name ?? this.name,

      phone: phone ?? this.phone,

      email: email ?? this.email,

      address: address ?? this.address,

      currency: currency ?? this.currency,

      createdAt: createdAt ?? this.createdAt,

      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
