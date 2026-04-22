import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static final _short = DateFormat('dd MMM yyyy', 'id_ID');
  static final _long = DateFormat('dd MMMM yyyy', 'id_ID');
  static final _numeric = DateFormat('dd/MM/yyyy', 'id_ID');
  static final _time = DateFormat('HH:mm', 'id_ID');
  static final _dateTime = DateFormat('dd MMM yyyy HH:mm', 'id_ID');

  /// 22 Apr 2026
  static String short(DateTime date) {
    return _short.format(date);
  }

  /// 22 April 2026
  static String long(DateTime date) {
    return _long.format(date);
  }

  /// 22/04/2026
  static String numeric(DateTime date) {
    return _numeric.format(date);
  }

  /// 14:30
  static String time(DateTime date) {
    return _time.format(date);
  }

  /// 22 Apr 2026 14:30
  static String dateTime(DateTime date) {
    return _dateTime.format(date);
  }
}
