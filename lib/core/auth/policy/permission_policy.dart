import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/permission/policy_resolver.dart';
import 'package:app_laundry/core/auth/permission/role_permissions.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';

class PermissionPolicy {
  final SessionCubit session;
  final PolicyResolver resolver;

  PermissionPolicy(this.session, this.resolver);

  /// =========================
  /// BASIC
  /// =========================
  bool can(Permission permission) {
    if (!session.isActive) return false;

    final role = session.role;
    final permissions = RolePermissions.get(role);

    return permissions.contains(permission);
  }

  /// =========================
  /// WITH RESOURCE (ownership, dll)
  /// =========================
  bool canWith<T>(Permission permission, {T? resource}) {
    // 1. cek role dulu
    if (!can(permission)) return false;

    // 2. kalau tidak ada resource
    if (resource == null) return true;

    // 3. resolve policy
    final policy = resolver.resolve(resource);

    if (policy == null) return true;

    return policy.can(permission, resource);
  }
}
