// =============================================================================
// File        : session_service.dart
// Path        : lib/core/auth/session/domain/services/session_service.dart
// Layer       : Core (Session)
// -----------------------------------------------------------------------------
// Fungsi:
// - Contract akses session aktif aplikasi
// - Menyediakan authenticated context
// =============================================================================

import 'package:app_laundry/core/auth/role/user_role.dart';

import 'package:app_laundry/core/auth/session/domain/entities/session_auth_entity.dart';

import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

abstract class SessionService {
  // =========================
  // STATUS
  // =========================

  bool get isActive;

  // =========================
  // SESSION
  // =========================

  SessionAuthEntity? get sessionOrNull;

  // =========================
  // USER
  // =========================

  String get userId;

  UserEntity? get userOrNull;

  // =========================
  // COMPANY
  // =========================

  String get companyId;

  CompanyEntity? get companyOrNull;

  // =========================
  // ROLE
  // =========================

  UserRole get role;
}
