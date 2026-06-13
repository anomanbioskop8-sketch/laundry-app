import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:flutter/material.dart';

extension OrderPaymentExt on OrderEntity {
  String get paymentLabel => paymentStatus.label;

  IconData get paymentIcon => paymentStatus.icon;

  Color paymentColor(BuildContext context) => paymentStatus.color(context);
}
