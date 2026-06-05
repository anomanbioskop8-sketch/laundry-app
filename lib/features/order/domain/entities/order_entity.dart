import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status.dart';

class OrderEntity {
  final String id;
  final String invoiceNumber;
  final String customerId;
  final List<OrderGroupEntity> groups;
  final OrderStatus orderStatus;
  final PaymentStatus paymentStatus;
  final int total;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const OrderEntity({
    required this.id,
    required this.invoiceNumber,
    required this.customerId,
    required this.groups,
    required this.orderStatus,
    required this.paymentStatus,
    required this.total,
    this.createdAt,
    this.updatedAt,
  });

  // =========================
  // COPY WITH
  // =========================

  OrderEntity copyWith({
    String? id,
    String? invoiceNumber,
    String? customerId,
    List<OrderGroupEntity>? groups,
    OrderStatus? orderStatus,
    PaymentStatus? paymentStatus,
    int? total,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      customerId: customerId ?? this.customerId,
      groups: groups ?? this.groups,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
