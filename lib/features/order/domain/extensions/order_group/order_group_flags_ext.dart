import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';

extension OrderGroupFlagsExt on OrderGroupEntity {
  bool get isKg => orderType.isKg;

  bool get isPcs => orderType.isPcs;

  bool get hasWeight => (weight ?? 0) > 0;
}
