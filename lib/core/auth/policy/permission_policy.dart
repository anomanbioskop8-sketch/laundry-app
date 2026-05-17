// =============================================================================
// File        : permission_policy.dart
// Path        : lib/core/auth/policy/permission_policy.dart
// Layer       : Core (Authorization Engine)
// -----------------------------------------------------------------------------
// Fungsi:
// - Engine utama pengecekan permission aplikasi
// - Menggabungkan Role-Based Access Control (RBAC)
//   + Resource-Based Access Control (Policy)
//
// Konsep utama:
// 1. RBAC (RolePermissions)
//    → menentukan permission dasar dari role user
//
// 2. Policy-Based Access (PolicyResolver)
//    → override/validasi berdasarkan resource (ownership, status, dll)
//
// Flow pengecekan:
// - Step 1: cek permission dari role
// - Step 2: jika resource ada → cek policy spesifik
// - Step 3: policy dapat memperketat atau memperbolehkan akses
//
// Contoh use case:
// - Role boleh delete order
// - Tapi policy bisa melarang jika status = DONE
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/permission/policy_resolver.dart';
import 'package:app_laundry/core/auth/permission/role_permissions.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';

class PermissionPolicy {
  final SessionService session;
  final PolicyResolver resolver;

  PermissionPolicy({required this.session, required this.resolver});

  // =========================
  // BASIC CHECK (ROLE ONLY)
  // =========================
  /// Mengecek permission hanya berdasarkan role user
  ///
  /// Return:
  /// - true  → role memiliki permission
  /// - false → role tidak memiliki permission
  bool can(Permission permission) {
    final role = session.role;
    final permissions = RolePermissions.get(role);

    return permissions.contains(permission);
  }

  // =========================
  // CHECK WITH RESOURCE
  // =========================
  /// Mengecek permission dengan konteks resource (entity)
  ///
  /// Flow:
  /// 1. Cek role permission terlebih dahulu
  /// 2. Jika tidak punya → langsung false
  /// 3. Jika tidak ada resource → true (role cukup)
  /// 4. Resolve policy berdasarkan resource type
  /// 5. Delegasi ke policy spesifik (ownership, status, dll)
  bool canWith(Permission permission, {Object? resource}) {
    // 1. Role-based guard
    if (!can(permission)) return false;

    // 2. No resource → role permission is enough
    if (resource == null) return true;

    // 3. Resolve policy berdasarkan tipe resource
    final policy = resolver.resolve(resource);

    // 4. Jika tidak ada policy → fallback ke role
    if (policy == null) return true;

    // 5. Delegasi ke policy spesifik (domain logic)
    return policy.can(permission, resource);
  }
}
