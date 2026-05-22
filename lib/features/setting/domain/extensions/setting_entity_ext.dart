// features/laundry_price/domain/entities/laundry_price_entity_ext.dart

import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

extension SettingEntityExt on SettingEntity {
  /// =========================
  /// PRICE
  /// =========================

  String get formattedRegularPrice {
    return CurrencyFormatter.idr(regularPrice);
  }

  String get formattedExpressPrice {
    return CurrencyFormatter.idr(expressPrice);
  }

  String get formattedRegularEstimation {
    return '$regularEstimation Hari';
  }

  String get formattedExpressEstimation {
    return '$expressEstimation Hari';
  }
}
