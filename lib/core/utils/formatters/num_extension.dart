import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/core/utils/formatters/number_formatter.dart';

extension NumExtension on num {
  String toRupiah() => CurrencyFormatter.toRupiah(this);

  String toThousand() => NumberFormatter.format(this);

  /// Optional: format nullable safe
  String toRupiahOrDash() {
    if (this == 0) return '-';
    return toRupiah();
  }
}
