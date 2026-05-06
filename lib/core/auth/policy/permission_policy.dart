// =============================================================================
// File        : permission_policy.dart
// Path        : lib/core/auth/policy/permission_policy.dart
// Layer       : Core (Authorization)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan apakah user memiliki permission
// - Mendukung role-based & resource-based (policy)
// =============================================================================

import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/permission/policy_resolver.dart';
import 'package:app_laundry/core/auth/permission/role_permissions.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';

class PermissionPolicy {
  final SessionService session;
  final PolicyResolver resolver;

  PermissionPolicy({required this.session, required this.resolver});

  /// =========================
  /// BASIC CHECK (ROLE ONLY)
  /// =========================
  bool can(Permission permission) {
    final role = session.role;
    final permissions = RolePermissions.get(role);

    return permissions.contains(permission);
  }

  /// =========================
  /// CHECK WITH RESOURCE
  /// =========================
  bool canWith(Permission permission, {Object? resource}) {
    /// 1. 🔥 Guard role permission
    if (!can(permission)) return false;

    /// 2. 🔥 Tidak ada resource → cukup role saja
    if (resource == null) return true;

    /// 3. 🔥 Resolve policy berdasarkan resource
    final policy = resolver.resolve(resource);

    /// 4. 🔥 Tidak ada policy → fallback allow (role cukup)
    if (policy == null) return true;

    /// 5. 🔥 Delegasi ke policy spesifik (ownership, dll)
    return policy.can(permission, resource);
  }
}
