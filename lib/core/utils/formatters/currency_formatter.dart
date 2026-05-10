// core/utils/currency_formatter.dart

import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static final _idrFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  /// =========================
  /// FORMAT IDR
  /// =========================

  static String idr(num value) {
    return _idrFormatter.format(value);
  }
}
