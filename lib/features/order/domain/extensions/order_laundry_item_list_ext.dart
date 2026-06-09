import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

extension OrderLaundryItemListExt on List<OrderLaundryItemEntity> {
  List<OrderLaundryItemEntity> byCategory(LaundryItemCategory? category) {
    if (category == null) return this;

    return where((e) => e.category == category).toList();
  }
}
