// =============================================================================
// File : order_with_customer_entity.dart
// =============================================================================

import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

class OrderWithCustomerEntity {
  final OrderEntity order;
  final CustomerEntity? customer;

  const OrderWithCustomerEntity({required this.order, required this.customer});
}
