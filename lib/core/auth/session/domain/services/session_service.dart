import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

abstract class SessionService {
  bool get isActive;
  String get userId;
  String get companyId;
  UserRole get role;
  UserEntity? get userOrNull;
}
