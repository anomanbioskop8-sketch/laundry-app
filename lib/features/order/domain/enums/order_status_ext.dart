// =============================================================================
// File        : order_status_ext.dart
// Path        : lib/features/order/domain/enums/order_status_ext.dart
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

import 'order_status.dart';

extension OrderStatusExt on OrderStatus {
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

      case OrderStatus.canceled:
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

      case OrderStatus.canceled:
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

      case OrderStatus.canceled:
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
      case OrderStatus.canceled:
        return context.status.canceled;
    }
  }

  // =========================
  // NEXT STATUS
  // =========================

  OrderStatus? get next {
    switch (this) {
      case OrderStatus.received:
        return OrderStatus.inProgress;

      case OrderStatus.inProgress:
        return OrderStatus.ready;

      case OrderStatus.ready:
        return OrderStatus.pickedUp;

      case OrderStatus.pickedUp:
        return null;

      case OrderStatus.canceled:
        return null;
    }
  }

  // =========================
  // CAN MOVE NEXT
  // =========================

  bool get canMoveNext {
    return next != null;
  }

  // =========================
  // IS FINISHED
  // =========================

  bool get isFinished {
    return this == OrderStatus.pickedUp || this == OrderStatus.canceled;
  }

  // =========================
  // FROM STRING
  // =========================

  static OrderStatus fromString(String value) {
    switch (value) {
      case 'received':
        return OrderStatus.received;

      case 'in_progress':
        return OrderStatus.inProgress;

      case 'ready':
        return OrderStatus.ready;

      case 'picked_up':
        return OrderStatus.pickedUp;

      case 'canceled':
        return OrderStatus.canceled;

      default:
        return OrderStatus.received;
    }
  }

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

      case OrderStatus.canceled:
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

      case OrderStatus.canceled:
        return AppIcons.canceled;
    }
  }

  // =========================
  // SUCCESS MESSAGE
  // =========================

  String get successMessage {
    switch (this) {
      case OrderStatus.received:
        return OrderStrings.processSuccess;

      case OrderStatus.inProgress:
        return OrderStrings.completeSuccess;

      case OrderStatus.ready:
        return OrderStrings.pickupSuccess;

      case OrderStatus.pickedUp:
        return 'Order sudah diambil customer';

      case OrderStatus.canceled:
        return OrderStrings.cancelSuccess;
    }
  }

  // =========================
  // CONFIRM MESSAGE
  // =========================

  String get confirmMessage {
    switch (this) {
      case OrderStatus.received:
        return OrderStrings.confirmProcess;

      case OrderStatus.inProgress:
        return OrderStrings.confirmComplete;

      case OrderStatus.ready:
        return OrderStrings.confirmPickup;

      case OrderStatus.pickedUp:
        return 'Order sudah diambil customer';

      case OrderStatus.canceled:
        return OrderStrings.confirmCancel;
    }
  }
}
