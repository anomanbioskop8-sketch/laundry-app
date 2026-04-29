import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class CustomerDeletePolicy {
  final SessionCubit session;

  CustomerDeletePolicy(this.session);

  bool canDelete(CustomerEntity customer) {
    if (!session.isActive) return false;

    final user = session.user;

    // hanya owner
    return user.role == UserRole.owner;
  }
}
