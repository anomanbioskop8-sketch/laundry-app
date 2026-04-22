import 'date_formatter.dart';

extension DateExtension on DateTime {
  String toShortDate() => DateFormatter.short(this);

  String toLongDate() => DateFormatter.long(this);

  String toNumericDate() => DateFormatter.numeric(this);

  String toTime() => DateFormatter.time(this);

  String toDateTime() => DateFormatter.dateTime(this);
}
