// =============================================================================
// File        : string_order_type_ext.dart
// Path        : lib/features/laundry_price/domain/extensions/string_order_type_ext.dart
// =============================================================================

import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';

extension StringLaundryOrderTypeExt on String {
  LaundryOrderType get toLaundryOrderType {
    return LaundryOrderTypeExt.fromString(this);
  }
}
