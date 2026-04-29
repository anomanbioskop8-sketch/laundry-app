import 'package:app_laundry/core/auth/policy/base_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_policy.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class PolicyResolver {
  final CustomerPolicy customerPolicy;
  //final OrderPolicy orderPolicy;

  PolicyResolver(
    this.customerPolicy,
    //this.orderPolicy,
  );

  BasePolicy? resolve(dynamic resource) {
    if (resource is CustomerEntity) return customerPolicy;
    //if (resource is OrderEntity) return orderPolicy;

    return null;
  }
}
