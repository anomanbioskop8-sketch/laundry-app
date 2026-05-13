import 'package:app_laundry/core/auth/role/user_role.dart';

import 'permission.dart';

class RolePermissions {
  static const Map<UserRole, Set<Permission>> _map = {
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

    UserRole.staff: {
      Permission.canViewCustomer,
      Permission.canCreateCustomer,
      Permission.canUpdateCustomer,
    },

    UserRole.cashier: {Permission.canViewCustomer},
  };

  static Set<Permission> get(UserRole role) {
    return _map[role] ?? {};
  }
}
