import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/role/user_role_mapper.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String companyId;
  final UserRole role;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.companyId,
    required this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      companyId: map['companyId'] ?? '',
      role: mapRole(map['role']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyId': companyId,
      'name': name,
      'email': email,
      'role': role.name,
    };
  }
}
