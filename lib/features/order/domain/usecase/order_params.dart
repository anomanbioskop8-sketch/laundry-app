import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

import 'package:app_laundry/features/order/domain/enums/payment_status.dart';

class SaveOrderParams {
  final String? id;

  //final CustomerEntity customer;

  final List<OrderGroupEntity> items;

  final int paid;

  const SaveOrderParams({
    this.id,
    //required this.customer,
    required this.items,
    required this.paid,
  });
}

class CreateOrderParams {
  final String customerId;
  final List<OrderGroupEntity> groups;
  final PaymentStatus paymentStatus;

  CreateOrderParams({
    required this.customerId,
    required this.groups,
    required this.paymentStatus,
  });
}

// =========================
// DELETE
// =========================

class DeleteOrderParams {
  final String id;

  const DeleteOrderParams({required this.id});
}

// =========================
// PAY
// =========================

class PayOrderParams {
  final OrderEntity order;
  final int amount;

  const PayOrderParams({required this.order, required this.amount});
}
