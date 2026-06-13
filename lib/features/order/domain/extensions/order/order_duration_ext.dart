import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_list_ext.dart';

extension OrderDurationExt on OrderEntity {
  Duration get estimatedDuration {
    return groups.longestEstimatedDuration;
  }

  Duration get nearestEstimatedDuration {
    return groups.shortestEstimatedDuration;
  }
}
