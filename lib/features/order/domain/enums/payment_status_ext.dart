// =============================================================================
// File        : payment_status_ext.dart
// Path        : lib/features/order/domain/enums/payment_status_ext.dart
// =============================================================================

import 'package:app_laundry/core/form/fields/form_option.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
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
        return AppIcons.unPaid;

      case PaymentStatus.paid:
        return AppIcons.paid;
    }
  }

  Color color(BuildContext context) {
    switch (this) {
      case PaymentStatus.unpaid:
        return context.status.error;

      case PaymentStatus.paid:
        return context.status.success;
    }
  }

  // =========================
  // FROM STRING
  // =========================

  static PaymentStatus fromString(String value) {
    switch (value) {
      case 'paid':
        return PaymentStatus.paid;

      default:
        return PaymentStatus.unpaid;
    }
  }

  // =========================
  // FORM OPTION
  // =========================

  FormOption get option {
    return FormOption(value: value, label: label, icon: icon);
  }

  // =========================
  // FORM OPTIONS
  // =========================

  static List<FormOption> get options {
    return PaymentStatus.values.map((e) => e.option).toList();
  }
}
