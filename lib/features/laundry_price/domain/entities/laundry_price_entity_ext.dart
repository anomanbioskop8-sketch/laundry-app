// features/laundry_price/domain/entities/laundry_price_entity_ext.dart

import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/order_type_ext.dart';
import 'package:flutter/material.dart';

extension LaundryPriceEntityX on LaundryPriceEntity {
  /// =========================
  /// ORDER
  /// =========================

  String get orderLabel => orderType.label;

  IconData get orderIcon => orderType.icon;

  /// =========================
  /// SERVICE
  /// =========================

  String get serviceLabel => serviceType.label;

  Color get serviceColor => serviceType.color;

  /// =========================
  /// PRICE
  /// =========================

  String get formattedPrice {
    return CurrencyFormatter.idr(price);
  }

  String get title {
    return '$orderLabel $serviceLabel';
  }
}
