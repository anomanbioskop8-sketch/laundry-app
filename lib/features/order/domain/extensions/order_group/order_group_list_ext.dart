import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_price_ext.dart';

extension OrderGroupListExt on List<OrderGroupEntity> {
  int get grandTotal {
    return fold(0, (sum, group) => sum + group.subtotal);
  }

  Duration get longestEstimatedDuration {
    if (isEmpty) return Duration.zero;

    return map((e) => e.estimatedDuration).reduce((a, b) => a > b ? a : b);
  }

  Duration get shortestEstimatedDuration {
    if (isEmpty) return Duration.zero;

    return map((e) => e.estimatedDuration).reduce((a, b) => a < b ? a : b);
  }
}
