import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_flags_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';

extension OrderGroupSummaryExt on OrderGroupEntity {
  int get totalQuantity => items.totalQuantity;

  String get summaryDisplay {
    if (isKg) {
      return '${weight ?? 0} Kg • $totalQuantity Item';
    }

    return '$totalQuantity Item';
  }
}
