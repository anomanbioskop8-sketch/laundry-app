// features/laundry_price/domain/entities/laundry_price_entity_ext.dart

import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:flutter/material.dart';

extension LaundryPriceEntityX on LaundryPriceEntity {
  /// =========================
  /// ORDER
  /// =========================

  String get speedLabel => speedType.label;

  IconData get speedIcon => speedType.icon;

  Color speedColor(BuildContext context) => speedType.color(context);

  /// =========================
  /// SERVICE
  /// =========================

  String get serviceLabel => serviceType.label;

  /// =========================
  /// PRICE
  /// =========================

  String get formattedPrice {
    return CurrencyFormatter.idr(price);
  }

  String get title {
    return '$speedLabel $serviceLabel';
  }
}
