// =============================================================================
// File : order_group_entity_ext.dart
// Path : features/order/domain/extensions/order_group_entity_ext.dart
// =============================================================================

import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:flutter/material.dart';

extension OrderGroupEntityX on OrderGroupEntity {
  // =========================
  // TITLE
  // =========================

  String get serviceLabel {
    return serviceType.label;
  }

  String get orderLabel {
    return orderType.label;
  }

  String get speedLabel {
    return speedType.label;
  }

  IconData get orderIcon {
    return orderType.icon;
  }

  IconData get speedIcon {
    return speedType.icon;
  }

  Color orderColor(BuildContext context) {
    return speedType.color(context);
  }

  // =========================
  // DESCRIPTION
  // =========================

  String get description {
    if (orderType.isKg) {
      return '${weight ?? 0} Kg • '
          '$totalItems Item';
    }

    return '$totalItems Item';
  }

  // =========================
  // FORMATTED PRICE
  // =========================

  String get formattedPrice {
    return CurrencyFormatter.idr(price);
  }

  String get formattedSubtotal {
    return CurrencyFormatter.idr(subtotal);
  }

  // =========================
  // HELPERS
  // =========================

  bool get isKg => orderType.isKg;

  bool get isPcs => orderType.isPcs;

  bool get hasWeight => weight != null && weight! > 0;

  int get totalQuantity {
    return items.fold(0, (sum, e) => sum + e.quantity);
  }
}
