// =============================================================================
// File        : session_auth_entity.dart
// Path        : lib/core/auth/session/domain/entities/session_auth_entity.dart
// Layer       : Core (Session)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyimpan data authenticated session
// - Kombinasi user + company aktif
// =============================================================================

import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

class SessionAuthEntity {
  // =========================
  // USER
  // =========================

  final UserEntity user;

  // =========================
  // COMPANY
  // =========================

  final CompanyEntity? company;

  const SessionAuthEntity({required this.user, this.company});

  // =========================
  // COPY WITH
  // =========================

  SessionAuthEntity copyWith({UserEntity? user, CompanyEntity? company}) {
    return SessionAuthEntity(
      user: user ?? this.user,

      company: company ?? this.company,
    );
  }
}
