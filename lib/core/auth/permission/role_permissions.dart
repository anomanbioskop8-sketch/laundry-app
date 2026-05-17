// =============================================================================
// File        : role_permissions.dart
// Path        : lib/core/auth/permission/role_permissions.dart
// Layer       : Core (Authorization / RBAC)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mendefinisikan permission berdasarkan role user (RBAC)
// - Menjadi sumber utama mapping antara UserRole dan Permission
// - Digunakan oleh PermissionPolicy sebagai baseline access control
//
// Cara kerja:
// - Setiap UserRole memiliki daftar Permission yang diizinkan
// - PermissionService akan mengecek akses berdasarkan role ini
// - Bisa dikombinasikan dengan resource-based policy (ownership)
//
// Notes:
// - Owner = full access (semua fitur utama)
// - Staff = akses terbatas operasional customer
// - Cashier = akses minimal (read-only customer)
// - Default: role tidak dikenali → empty permission set
// =============================================================================

import 'package:app_laundry/core/auth/role/user_role.dart';
import 'permission.dart';

class RolePermissions {
  /// Mapping role → permissions
  /// Menggunakan Set agar tidak ada duplikasi permission
  static const Map<UserRole, Set<Permission>> _map = {
    // =========================
    // OWNER (FULL ACCESS)
    // =========================
    UserRole.owner: {
      Permission.canViewOrder,
      Permission.canCreateOrder,
      Permission.canUpdateOrder,
      Permission.canDeleteOrder,

      Permission.canViewCustomer,
      Permission.canCreateCustomer,
      Permission.canUpdateCustomer,
      Permission.canDeleteCustomer,

      Permission.canViewLaundryItem,
      Permission.canCreateLaundryItem,
      Permission.canUpdateLaundryItem,
      Permission.canDeleteLaundryItem,

      Permission.canViewLaundryPrice,
      Permission.canCreateLaundryPrice,
      Permission.canUpdateLaundryPrice,

      Permission.canChangeStatus,
      Permission.canPayOrder,
      Permission.canDeleteLaundryPrice,
    },

    // =========================
    // STAFF (LIMITED CUSTOMER MANAGEMENT)
    // =========================
    UserRole.staff: {
      Permission.canViewCustomer,
      Permission.canCreateCustomer,
      Permission.canUpdateCustomer,
    },

    // =========================
    // CASHIER (READ-ONLY CUSTOMER ACCESS)
    // =========================
    UserRole.cashier: {Permission.canViewCustomer},
  };

  /// Mengambil daftar permission berdasarkan role user
  static Set<Permission> get(UserRole role) {
    return _map[role] ?? {};
  }
}
