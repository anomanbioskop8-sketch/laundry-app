// =============================================================================
// File        : payment_status_ext.dart
// Path        : lib/features/order/domain/enums/payment_status_ext.dart
// =============================================================================

import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

import 'payment_status.dart';

extension PaymentStatusExt on PaymentStatus {
  // =========================
  // VALUE
  // =========================

  String get value {
    switch (this) {
      case PaymentStatus.unpaid:
        return 'unpaid';

      case PaymentStatus.partial:
        return 'partial';

      case PaymentStatus.paid:
        return 'paid';
    }
  }

  // =========================
  // LABEL
  // =========================

  String get label {
    switch (this) {
      case PaymentStatus.unpaid:
        return 'Belum Bayar';

      case PaymentStatus.partial:
        return 'DP';

      case PaymentStatus.paid:
        return 'Lunas';
    }
  }

  // =========================
  // ICON
  // =========================

  IconData get icon {
    switch (this) {
      case PaymentStatus.unpaid:
        return Icons.money_off_rounded;

      case PaymentStatus.partial:
        return Icons.payments_rounded;

      case PaymentStatus.paid:
        return Icons.check_circle_rounded;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case PaymentStatus.unpaid:
        return context.status.cancel;
      case PaymentStatus.partial:
        return context.status.warning;
      case PaymentStatus.paid:
        return context.status.success;
    }
  }

  // =========================
  // FROM STRING
  // =========================

  static PaymentStatus fromString(String value) {
    switch (value) {
      case 'partial':
        return PaymentStatus.partial;

      case 'paid':
        return PaymentStatus.paid;

      default:
        return PaymentStatus.unpaid;
    }
  }
}
