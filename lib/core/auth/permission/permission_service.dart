import 'package:app_laundry/core/auth/policy/permission_policy.dart';

import 'permission.dart';

class PermissionService {
  final PermissionPolicy _policy;

  PermissionService(this._policy);

  /// =========================
  /// BASIC CHECK
  /// =========================
  bool can(Permission permission) {
    return _policy.can(permission);
  }

  /// =========================
  /// WITH CONTEXT (entity / ownership)
  /// =========================
  bool canWith<T>(Permission permission, {T? resource}) {
    return _policy.canWith(permission, resource: resource);
  }

  /// =========================
  /// MULTI CHECK (ALL)
  /// =========================
  bool canAll(List<Permission> permissions) {
    return permissions.every(_policy.can);
  }

  /// =========================
  /// MULTI CHECK (ANY)
  /// =========================
  bool canAny(List<Permission> permissions) {
    return permissions.any(_policy.can);
  }
}
