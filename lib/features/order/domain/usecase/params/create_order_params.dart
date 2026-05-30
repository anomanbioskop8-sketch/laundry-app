import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status.dart';

class CreateOrderParams {
  final CustomerEntity customer;
  final List<OrderGroupEntity> groups;
  final PaymentStatus paymentStatus;

  CreateOrderParams({
    required this.customer,
    required this.groups,
    required this.paymentStatus,
  });
}
