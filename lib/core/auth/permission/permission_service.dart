// =============================================================================
// File        : permission_service.dart
// Path        : lib/core/auth/permission/permission_service.dart
// Layer       : Core (Authorization)
// -----------------------------------------------------------------------------
// Fungsi:
// - Interface utama untuk pengecekan permission di seluruh aplikasi
// - Menyederhanakan akses ke PermissionPolicy
// =============================================================================

import 'package:app_laundry/core/auth/policy/permission_policy.dart';
import 'permission.dart';

class PermissionService {
  final PermissionPolicy policy;

  PermissionService(this.policy);

  /// =========================
  /// SINGLE CHECK
  /// =========================
  bool can(Permission permission) {
    return policy.can(permission);
  }

  /// =========================
  /// CHECK WITH CONTEXT (resource / ownership)
  /// =========================
  bool canWith<T>(Permission permission, {T? resource}) {
    return policy.canWith(permission, resource: resource);
  }

  /// =========================
  /// MULTI CHECK (ALL)
  /// =========================
  bool canAll(List<Permission> permissions) {
    return permissions.every(policy.can);
  }

  /// =========================
  /// MULTI CHECK (ANY)
  /// =========================
  bool canAny(List<Permission> permissions) {
    return permissions.any(policy.can);
  }

  /// =========================
  /// MULTI CHECK WITH CONTEXT (ALL)
  /// =========================
  bool canAllWith<T>(List<Permission> permissions, {T? resource}) {
    return permissions.every((p) => policy.canWith(p, resource: resource));
  }

  /// =========================
  /// MULTI CHECK WITH CONTEXT (ANY)
  /// =========================
  bool canAnyWith<T>(List<Permission> permissions, {T? resource}) {
    return permissions.any((p) => policy.canWith(p, resource: resource));
  }
}
