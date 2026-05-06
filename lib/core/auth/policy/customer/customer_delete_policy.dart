import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class CustomerDeletePolicy {
  final SessionService session;

  CustomerDeletePolicy(this.session);

  bool canDelete(CustomerEntity customer) {
    final userRole = session.role;

    // hanya owner
    return userRole == UserRole.owner;
  }
}
