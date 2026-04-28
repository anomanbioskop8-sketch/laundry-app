// core/services/permission/permission_service.dart

import 'package:app_laundry/core/session/domain/services/session_service.dart';

class PermissionService {
  final SessionService session;

  PermissionService(this.session);

  // =========================
  // BASE
  // =========================
  //UserRole get role => session.role;
  String get role => session.role;

  bool get isOwner => role == 'owner';
  bool get isAdmin => role == 'admin';
  bool get isStaff => role == 'staff';

  // =========================
  // CUSTOMER PERMISSION
  // =========================
  bool canViewCustomer() => true;

  bool canCreateCustomer() => isAdmin || isOwner;

  bool canEditCustomer() => isAdmin || isOwner;

  bool canDeleteCustomer() => isOwner; // 🔥 stricter rule

  // =========================
  // GENERIC (OPTIONAL)
  // =========================
  bool hasRole(List<String> roles) {
    return roles.contains(role);
  }
}
