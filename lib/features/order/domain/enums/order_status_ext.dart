// =============================================================================
// File        : order_status_ext.dart
// Path        : lib/features/order/domain/enums/order_status_ext.dart
// =============================================================================

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
      case OrderStatus.pending:
        return 'pending';

      case OrderStatus.process:
        return 'process';

      case OrderStatus.done:
        return 'done';

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
      case OrderStatus.pending:
        return 'Pending';

      case OrderStatus.process:
        return 'Diproses';

      case OrderStatus.done:
        return 'Selesai';

      case OrderStatus.pickedUp:
        return 'Diambil';

      case OrderStatus.canceled:
        return 'Dibatalkan';
    }
  }

  // =========================
  // ICON
  // =========================

  IconData get icon {
    switch (this) {
      case OrderStatus.pending:
        return Icons.schedule_rounded;

      case OrderStatus.process:
        return Icons.local_laundry_service_rounded;

      case OrderStatus.done:
        return Icons.check_circle_rounded;

      case OrderStatus.pickedUp:
        return Icons.inventory_2_rounded;

      case OrderStatus.canceled:
        return Icons.cancel_rounded;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case OrderStatus.pending:
        return context.status.pending;
      case OrderStatus.process:
        return context.status.process;
      case OrderStatus.done:
        return context.status.done;
      case OrderStatus.pickedUp:
        return context.status.process;
      case OrderStatus.canceled:
        return context.status.cancel;
    }
  }

  // =========================
  // NEXT STATUS
  // =========================

  OrderStatus? get next {
    switch (this) {
      case OrderStatus.pending:
        return OrderStatus.process;

      case OrderStatus.process:
        return OrderStatus.done;

      case OrderStatus.done:
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
      case 'process':
        return OrderStatus.process;

      case 'done':
        return OrderStatus.done;

      case 'picked_up':
        return OrderStatus.pickedUp;

      case 'canceled':
        return OrderStatus.canceled;

      default:
        return OrderStatus.pending;
    }
  }

  // =========================
  // ACTION LABEL
  // =========================

  String get actionLabel {
    switch (this) {
      case OrderStatus.pending:
        return OrderStrings.process;

      case OrderStatus.process:
        return OrderStrings.complete;

      case OrderStatus.done:
        return OrderStrings.pickup;

      case OrderStatus.pickedUp:
        return 'Order Sudah Diambil';

      case OrderStatus.canceled:
        return OrderStrings.cancel;
    }
  }

  // =========================
  // SUCCESS MESSAGE
  // =========================

  String get successMessage {
    switch (this) {
      case OrderStatus.pending:
        return OrderStrings.processSuccess;

      case OrderStatus.process:
        return OrderStrings.completeSuccess;

      case OrderStatus.done:
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
      case OrderStatus.pending:
        return OrderStrings.confirmProcess;

      case OrderStatus.process:
        return OrderStrings.confirmComplete;

      case OrderStatus.done:
        return OrderStrings.confirmPickup;

      case OrderStatus.pickedUp:
        return 'Order sudah diambil customer';

      case OrderStatus.canceled:
        return OrderStrings.confirmCancel;
    }
  }
}
