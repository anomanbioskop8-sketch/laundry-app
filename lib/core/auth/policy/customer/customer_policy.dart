import 'package:app_laundry/core/auth/permission/permission.dart';
import 'package:app_laundry/core/auth/policy/base_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_delete_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_update_policy.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class CustomerPolicy implements BasePolicy<CustomerEntity> {
  final CustomerDeletePolicy deletePolicy;
  final CustomerUpdatePolicy updatePolicy;

  CustomerPolicy(this.deletePolicy, this.updatePolicy);

  @override
  bool can(Permission permission, CustomerEntity customer) {
    switch (permission) {
      case Permission.canDeleteCustomer:
        return deletePolicy.canDelete(customer);

      case Permission.canUpdateCustomer:
        return updatePolicy.canUpdate(customer);

      default:
        return true;
    }
  }

  /// optional (biar enak dipakai function-based)
  bool canDelete(CustomerEntity customer) => deletePolicy.canDelete(customer);

  bool canUpdate(CustomerEntity customer) => updatePolicy.canUpdate(customer);
}
