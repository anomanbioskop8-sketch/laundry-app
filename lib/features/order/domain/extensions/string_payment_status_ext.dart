// =============================================================================
// File        : string_payment_status_ext.dart
// Path        : lib/features/order/domain/extensions/string_payment_status_ext.dart
// =============================================================================

import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';

extension StringPaymentStatusExt on String {
  PaymentStatus get toPaymentStatus {
    return PaymentStatusExt.fromString(this);
  }
}
