import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';

class OrderLaundryItemEntity {
  final String itemId;
  final String itemName;
  final int qty;
  final int price;
  final LaundryItemCategory category;

  const OrderLaundryItemEntity({
    required this.itemId,
    required this.itemName,
    required this.qty,
    required this.price,
    required this.category,
  });

  OrderLaundryItemEntity copyWith({
    String? itemId,
    String? itemName,
    int? qty,
    int? price,
    LaundryItemCategory? category,
  }) {
    return OrderLaundryItemEntity(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      qty: qty ?? this.qty,
      price: price ?? this.price,
      category: category ?? this.category,
    );
  }
}
