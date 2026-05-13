// features/laundry_price/domain/entities/laundry_price_entity_ext.dart

import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

extension OrderEntityExt on OrderEntity {
  /// =========================
  /// PRICE
  /// =========================

  String get formattedTotal {
    return CurrencyFormatter.idr(total);
  }

  String get createOrder {
    return createdAt.short;
  }
}
