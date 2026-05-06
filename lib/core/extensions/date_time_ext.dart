import 'package:app_laundry/core/utils/formatters/date_formatter.dart';

extension DateTimeExt on DateTime? {
  String get readable => DateFormatter.toReadable(this);
  String get short => DateFormatter.toShort(this);
  String get api => DateFormatter.toApi(this);
  String get dateTime => DateFormatter.toDateTime(this);
  String get time => DateFormatter.toTime(this);
}
