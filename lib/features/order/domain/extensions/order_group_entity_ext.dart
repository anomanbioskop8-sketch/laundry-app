// =============================================================================
// File : order_group_entity_ext.dart
// Path : features/order/domain/extensions/order_group_entity_ext.dart
// =============================================================================

import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';

import '../entities/order_group_entity.dart';

extension OrderGroupEntityX on OrderGroupEntity {
  // =========================
  // TITLE
  // =========================

  String get title {
    return '${serviceType.label} - '
        '${speedType.label}';
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
