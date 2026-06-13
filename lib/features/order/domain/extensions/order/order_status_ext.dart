import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_status/order_status_display_ext.dart';
import 'package:flutter/material.dart';

extension OrderStatusExt on OrderEntity {
  String get statusLabel => orderStatus.label;

  IconData get statusIcon => orderStatus.icon;

  Color statusColor(BuildContext context) => orderStatus.color(context);
}
