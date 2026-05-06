import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  /// Default format: 03 May 2026
  static String toReadable(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd MMM yyyy').format(date);
  }

  /// Format: 03/05/2026
  static String toShort(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Format: 2026-05-03 (ISO-like)
  static String toApi(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date);
  }

  /// Format: 03 May 2026, 14:30
  static String toDateTime(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd MMM yyyy, HH:mm').format(date);
  }

  /// Only time: 14:30
  static String toTime(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('HH:mm').format(date);
  }

  /// Custom format
  static String custom(DateTime? date, String format) {
    if (date == null) return '-';
    return DateFormat(format).format(date);
  }
}
