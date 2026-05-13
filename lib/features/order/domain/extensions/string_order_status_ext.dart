// =============================================================================
// File        : string_order_status_ext.dart
// Path        : lib/features/order/domain/extensions/string_order_status_ext.dart
// =============================================================================

import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:app_laundry/features/order/domain/enums/order_status_ext.dart';

extension StringOrderStatusExt on String {
  OrderStatus get toOrderStatus {
    return OrderStatusExt.fromString(this);
  }
}
