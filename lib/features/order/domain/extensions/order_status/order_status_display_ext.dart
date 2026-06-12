import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:flutter/material.dart';

extension OrderStatusDisplayExt on OrderStatus {
  // =========================
  // VALUE
  // =========================

  String get value {
    switch (this) {
      case OrderStatus.received:
        return 'received';
      case OrderStatus.inProgress:
        return 'in_progress';
      case OrderStatus.ready:
        return 'ready';
      case OrderStatus.pickedUp:
        return 'picked_up';
      case OrderStatus.cancelled:
        return 'canceled';
    }
  }

  // =========================
  // LABEL
  // =========================

  String get label {
    switch (this) {
      case OrderStatus.received:
        return 'Received';
      case OrderStatus.inProgress:
        return 'In Progress';
      case OrderStatus.ready:
        return 'Ready';
      case OrderStatus.pickedUp:
        return 'Picked Up';
      case OrderStatus.cancelled:
        return 'Canceled';
    }
  }

  // =========================
  // ICON
  // =========================

  IconData get icon {
    switch (this) {
      case OrderStatus.received:
        return AppIcons.received;
      case OrderStatus.inProgress:
        return AppIcons.inProgress;
      case OrderStatus.ready:
        return AppIcons.ready;
      case OrderStatus.pickedUp:
        return AppIcons.pickedUp;
      case OrderStatus.cancelled:
        return AppIcons.canceled;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case OrderStatus.received:
        return context.status.received;
      case OrderStatus.inProgress:
        return context.status.inProgress;
      case OrderStatus.ready:
        return context.status.ready;
      case OrderStatus.pickedUp:
        return context.status.pickedUp;
      case OrderStatus.cancelled:
        return context.status.canceled;
    }
  }
}
