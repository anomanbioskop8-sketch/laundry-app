import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group_entity_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';

extension CreateOrderParamsExt on CreateOrderParams {
  DateTime get deadlineAt => createdAt.add(groups.longestDuration);

  DateTime get nearestDeadlineAt => createdAt.add(groups.shortestDuration);

  String get createdAtFormatted => createdAt.readable;

  String get estimatedFinishedAtFormatted => deadlineAt.readable;
}
