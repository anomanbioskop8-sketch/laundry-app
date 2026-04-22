import 'package:intl/intl.dart';

class NumberFormatter {
  static final _decimal = NumberFormat.decimalPattern('id_ID');

  static String format(num value) {
    return _decimal.format(value);
  }
}
