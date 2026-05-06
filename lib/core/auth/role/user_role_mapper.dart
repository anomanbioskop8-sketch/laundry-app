import 'package:app_laundry/core/error/exceptions.dart';

import 'user_role.dart';

UserRole mapRole(String value) {
  switch (value) {
    case 'owner':
      return UserRole.owner;
    case 'staff':
      return UserRole.staff;
    case 'cashier':
      return UserRole.cashier;
    default:
      throw UnknownException('Unknown role: $value');
  }
}
