import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class CustomerUpdatePolicy {
  final SessionCubit session;

  CustomerUpdatePolicy(this.session);

  bool canUpdate(CustomerEntity customer) {
    if (!session.isActive) return false;

    final user = session.user;

    if (user.role == UserRole.owner) return true;

    // if (user.role == UserRole.cashier) {
    //   return customer.createdBy == user.id;
    // }

    return false;
  }
}
