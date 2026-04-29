import 'package:app_laundry/core/auth/permission/permission.dart';

abstract class BasePolicy<T> {
  bool can(Permission permission, T resource);
}
