import 'package:app_laundry/core/auth/role/user_role.dart';

abstract class SessionService {
  String get userId;
  String get companyId;
  UserRole get role;
}
