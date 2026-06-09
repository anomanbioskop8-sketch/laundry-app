// =============================================================================
// File : order_group_entity_ext.dart
// Path : features/order/domain/extensions/order_group_entity_ext.dart
// =============================================================================

import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';
import 'package:flutter/material.dart';

extension OrderGroupListExt on List<OrderGroupEntity> {
  int get grandTotal => fold(0, (sum, group) => sum + group.subtotal);
}

extension OrderGroupEntityExt on OrderGroupEntity {
  // =========================
  // DISPLAY
  // =========================

  String get serviceLabel => serviceType.label;

  String get orderLabel => orderType.label;

  String get speedLabel => speedType.label;

  IconData get orderIcon => orderType.icon;

  IconData get speedIcon => speedType.icon;

  Color speedColor(BuildContext context) => speedType.color(context);

  // =========================
  // DESCRIPTION
  // =========================

  String get description =>
      isKg ? '${weight ?? 0} Kg • $totalQuantity Item' : '$totalQuantity Item';

  // =========================
  // FORMATTING
  // =========================

  String get formattedPrice => CurrencyFormatter.idr(unitPrice);

  String get formattedSubtotal => CurrencyFormatter.idr(subtotal);

  // =========================
  // HELPERS
  // =========================

  bool get isKg => orderType.isKg;

  bool get isPcs => orderType.isPcs;

  bool get hasWeight => (weight ?? 0) > 0;

  int get totalQuantity => items.totalQuantity;

  int get subtotal {
    if (isKg) {
      return ((weight ?? 0) * unitPrice).round();
    }

    return items.subtotal;
  }

  String get calculationText {
    if (isKg) {
      return '${weight ?? 0} Kg × ${CurrencyFormatter.idr(unitPrice)}';
    }

    return '$totalQuantity Item';
  }

  String get subtotalDescription {
    if (isKg) {
      return '${weight ?? 0} Kg × ${CurrencyFormatter.idr(unitPrice)} = $formattedSubtotal';
    }

    return '$totalQuantity Item = $formattedSubtotal';
  }
}
