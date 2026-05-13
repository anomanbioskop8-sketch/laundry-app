// features/laundry/domain/enums/order_type_ext.dart

import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';

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
        return 'Per Pcs';

      case LaundryOrderType.kg:
        return 'Per Kg';
    }
  }

  // =========================
  // SHORT LABEL
  // =========================

  String get shortLabel {
    switch (this) {
      case LaundryOrderType.pcs:
        return 'PCS';

      case LaundryOrderType.kg:
        return 'KG';
    }
  }

  // =========================
  // ICON
  // =========================

  IconData get icon {
    switch (this) {
      case LaundryOrderType.pcs:
        return Icons.checkroom_rounded;

      case LaundryOrderType.kg:
        return Icons.scale_rounded;
    }
  }

  // =========================
  // COLOR
  // =========================

  Color get color {
    switch (this) {
      case LaundryOrderType.pcs:
        return AppSemanticColors.info;

      case LaundryOrderType.kg:
        return AppSemanticColors.success;
    }
  }

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
