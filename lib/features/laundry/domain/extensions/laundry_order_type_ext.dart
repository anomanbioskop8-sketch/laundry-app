// =============================================================================
// File : laundry_order_type_ext.dart
// =============================================================================

import 'package:flutter/material.dart';

import '../enums/laundry_order_type.dart';

extension LaundryOrderTypeExt on LaundryOrderType {
  // =========================
  // VALUE
  // =========================

  String get value {
    switch (this) {
      case LaundryOrderType.pcs:
        return 'pcs';

      case LaundryOrderType.kg:
        return 'kg';
    }
  }

  // =========================
  // LABEL
  // =========================

  String get label {
    switch (this) {
      case LaundryOrderType.pcs:
        return 'Per Item';

      case LaundryOrderType.kg:
        return 'Per Kg';
    }
  }

  // =========================
  // ICON
  // =========================

  IconData get icon {
    switch (this) {
      case LaundryOrderType.pcs:
        return Icons.checkroom;

      case LaundryOrderType.kg:
        return Icons.scale;
    }
  }

  // =========================
  // HELPERS
  // =========================

  bool get isKg => this == LaundryOrderType.kg;

  bool get isPcs => this == LaundryOrderType.pcs;

  // =========================
  // FROM STRING
  // =========================

  static LaundryOrderType fromString(String value) {
    switch (value) {
      case 'kg':
        return LaundryOrderType.kg;

      default:
        return LaundryOrderType.pcs;
    }
  }
}
