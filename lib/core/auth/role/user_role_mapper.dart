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
      throw Exception('Unknown role: $value');
  }
}
