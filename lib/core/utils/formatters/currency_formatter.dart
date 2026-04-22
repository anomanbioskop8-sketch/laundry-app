import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final _idr = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  static String toRupiah(num value) {
    return _idr.format(value);
  }
}
