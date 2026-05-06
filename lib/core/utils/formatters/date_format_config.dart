class DateFormatConfig {
  final String date;
  final String time;
  final String dateTime;

  const DateFormatConfig({
    this.date = 'dd MMM yyyy',
    this.time = 'HH:mm',
    this.dateTime = 'dd MMM yyyy, HH:mm',
  });
}
