// =============================================================================
// File        : permission_service.dart
// Path        : lib/core/auth/permission/permission_service.dart
// Layer       : Core (Authorization)
// -----------------------------------------------------------------------------
// Fungsi:
// - Interface utama untuk pengecekan permission di seluruh aplikasi
// - Wrapper dari PermissionPolicy agar lebih mudah digunakan di UI / Cubit
// - Menyediakan API single, multi, dan context-based permission check
//
// Notes:
// - Semua pengecekan permission mengarah ke PermissionPolicy
// - Resource-based permission menggunakan canWith<T>()
// =============================================================================

import 'package:app_laundry/core/auth/policy/permission_policy.dart';
import 'permission.dart';

class PermissionService {
  final PermissionPolicy policy;

  const PermissionService(this.policy);

  // ===========================================================================
  // SINGLE PERMISSION CHECK
  // ===========================================================================

  /// Mengecek apakah user memiliki 1 permission tertentu
  bool can(Permission permission) {
    return policy.can(permission);
  }

  // ===========================================================================
  // CONTEXT / RESOURCE BASED CHECK
  // ===========================================================================

  /// Mengecek permission dengan konteks resource (ownership / entity-based)
  bool canWith<T>(Permission permission, {T? resource}) {
    return policy.canWith(permission, resource: resource);
  }

  // ===========================================================================
  // MULTI PERMISSION CHECK (ALL)
  // ===========================================================================

  /// Semua permission harus terpenuhi (AND)
  bool canAll(List<Permission> permissions) {
    return permissions.every(policy.can);
  }

  /// Semua permission harus terpenuhi dengan context resource (AND)
  bool canAllWith<T>(List<Permission> permissions, {T? resource}) {
    return permissions.every((p) => policy.canWith(p, resource: resource));
  }

  // ===========================================================================
  // MULTI PERMISSION CHECK (ANY)
  // ===========================================================================

  /// Salah satu permission cukup terpenuhi (OR)
  bool canAny(List<Permission> permissions) {
    return permissions.any(policy.can);
  }

  /// Salah satu permission cukup terpenuhi dengan context resource (OR)
  bool canAnyWith<T>(List<Permission> permissions, {T? resource}) {
    return permissions.any((p) => policy.canWith(p, resource: resource));
  }
}
