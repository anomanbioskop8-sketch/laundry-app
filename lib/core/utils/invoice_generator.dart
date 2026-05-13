// core/utils/invoice_generator.dart

class InvoiceGenerator {
  InvoiceGenerator._();

  static String generate() {
    final now = DateTime.now();

    final date =
        '${now.year}'
        '${now.month.toString().padLeft(2, '0')}'
        '${now.day.toString().padLeft(2, '0')}';

    final time =
        '${now.hour.toString().padLeft(2, '0')}'
        '${now.minute.toString().padLeft(2, '0')}'
        '${now.second.toString().padLeft(2, '0')}';

    return 'INV-$date-$time';
  }
}
