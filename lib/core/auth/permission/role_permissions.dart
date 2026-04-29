import 'package:app_laundry/core/auth/role/user_role.dart';

import 'permission.dart';

class RolePermissions {
  static const Map<UserRole, Set<Permission>> _map = {
    UserRole.owner: {
      Permission.canViewCustomer,
      Permission.canCreateCustomer,
      Permission.canUpdateCustomer,
      Permission.canDeleteCustomer,
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
