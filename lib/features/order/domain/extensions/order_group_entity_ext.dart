// =============================================================================
// File : order_group_entity_ext.dart
// Path : features/order/domain/extensions/order_group_entity_ext.dart
// =============================================================================

import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';
import 'package:flutter/material.dart';

extension OrderGroupListExt on List<OrderGroupEntity> {
  int get grandTotal => fold(0, (sum, group) => sum + group.subtotal);

  Duration get longestDuration {
    if (isEmpty) return Duration.zero;

    return map(
      (e) => e.estimatedDuration,
    ).reduce((a, b) => a.inSeconds > b.inSeconds ? a : b);
  }

  Duration get shortestDuration {
    if (isEmpty) return Duration.zero;

    return map((e) => e.estimatedDuration).reduce((a, b) => a < b ? a : b);
  }
}

extension OrderGroupEntityExt on OrderGroupEntity {
  // ===========================================================================
  // DISPLAY
  // ===========================================================================

  String get serviceLabel => serviceType.label;
  String get orderLabel => orderType.label;
  String get speedLabel => speedType.label;

  IconData get serviceIcon => speedType.icon;
  IconData get orderIcon => orderType.icon;
  IconData get speedIcon => speedType.icon;

  Color speedColor(BuildContext context) => speedType.color(context);

  // ===========================================================================
  // FLAGS
  // ===========================================================================

  bool get isKg => orderType.isKg;

  bool get isPcs => orderType.isPcs;

  bool get hasWeight => (weight ?? 0) > 0;

  // ===========================================================================
  // SUMMARY
  // ===========================================================================

  int get totalQuantity => items.totalQuantity;

  String get description {
    if (isKg) {
      return '${weight ?? 0} Kg • $totalQuantity Item';
    }

    return '$totalQuantity Item';
  }

  // ===========================================================================
  // PRICE
  // ===========================================================================

  int get subtotal {
    if (isKg) {
      return ((weight ?? 0) * unitPrice).round();
    }

    return items.subtotal;
  }

  String get formattedPrice => CurrencyFormatter.idr(unitPrice);

  String get formattedSubtotal => CurrencyFormatter.idr(subtotal);

  String get calculationText {
    if (isKg) {
      return '${weight ?? 0} Kg × ${CurrencyFormatter.idr(unitPrice)}';
    }

    return '$totalQuantity Item';
  }

  String get subtotalDescription {
    if (isKg) {
      return '$calculationText = $formattedSubtotal';
    }

    return '$totalQuantity Item = $formattedSubtotal';
  }

  // ===========================================================================
  // ESTIMATION
  // ===========================================================================

  DateTime estimatedFinishAt(DateTime createdAt) {
    return createdAt.add(estimatedDuration);
  }

  String formattedEstimatedFinishAt(DateTime createdAt) {
    return estimatedFinishAt(createdAt).short;
  }

  int get estimationDays => estimatedDuration.inDays;

  String get estimationLabel {
    switch (estimationDays) {
      case 0:
        return 'Same Day';
      case 1:
        return '1 Hari';
      default:
        return '$estimationDays Hari';
    }
  }

  String get estimationDescription {
    return 'Durasi: $estimationLabel';
  }
}
