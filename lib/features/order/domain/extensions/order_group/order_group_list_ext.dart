import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_price_ext.dart';

extension OrderGroupListExt on List<OrderGroupEntity> {
  int get grandTotal {
    return fold(0, (sum, group) => sum + group.subtotal);
  }

  String get formattedGradtotal => CurrencyFormatter.idr(grandTotal);

  Duration get longestEstimatedDuration {
    if (isEmpty) return Duration.zero;

    return map((e) => e.estimatedDuration).reduce((a, b) => a > b ? a : b);
  }

  Duration get shortestEstimatedDuration {
    if (isEmpty) return Duration.zero;

    return map((e) => e.estimatedDuration).reduce((a, b) => a < b ? a : b);
  }
}
