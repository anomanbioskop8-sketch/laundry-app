import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_list_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';

extension CreateOrderParamsExt on CreateOrderParams {
  DateTime get estimatedFinishAt =>
      createdAt.add(groups.longestEstimatedDuration);

  String get formattedCreatedAt => createdAt.readable;

  String get formattedEstimatedFinishAt => estimatedFinishAt.readable;
}
