import 'package:app_laundry/core/auth/role/user_role.dart';

class UserEntity {
  final String id;
  final String name;
  final String email;
  final String companyId;
  final UserRole role;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.companyId,
    required this.role,
  });
}
