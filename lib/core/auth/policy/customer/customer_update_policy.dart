import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class CustomerUpdatePolicy {
  final SessionService session;

  CustomerUpdatePolicy(this.session);

  bool canUpdate(CustomerEntity customer) {
    final userRole = session.role;

    if (userRole == UserRole.owner) return true;

    // if (user.role == UserRole.cashier) {
    //   return customer.createdBy == user.id;
    // }

    return false;
  }
}
