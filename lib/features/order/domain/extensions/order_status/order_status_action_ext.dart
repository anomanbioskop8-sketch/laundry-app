import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:flutter/material.dart';

extension OrderStatusActionExt on OrderStatus {
  // =========================
  // ACTION LABEL
  // =========================

  String get actionLabel {
    switch (this) {
      case OrderStatus.received:
        return OrderStrings.process;
      case OrderStatus.inProgress:
        return OrderStrings.complete;
      case OrderStatus.ready:
        return OrderStrings.pickup;
      case OrderStatus.pickedUp:
        return 'Order Sudah Diambil';
      case OrderStatus.cancelled:
        return OrderStrings.cancel;
    }
  }
  // =========================
  // ACTION ICON
  // =========================

  IconData get actionIcon {
    switch (this) {
      case OrderStatus.received:
        return AppIcons.inProgress;
      case OrderStatus.inProgress:
        return AppIcons.ready;
      case OrderStatus.ready:
        return AppIcons.pickedUp;
      case OrderStatus.pickedUp:
        return AppIcons.pickedUp;
      case OrderStatus.cancelled:
        return AppIcons.canceled;
    }
  }
}
