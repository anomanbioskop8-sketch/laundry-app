class OrderLaundryItemEntity {
  final String itemId;
  final String itemName;
  final int qty;
  final int price;

  const OrderLaundryItemEntity({
    required this.itemId,
    required this.itemName,
    required this.qty,
    required this.price,
  });

  OrderLaundryItemEntity copyWith({
    String? itemId,
    String? itemName,
    int? qty,
    int? price,
  }) {
    return OrderLaundryItemEntity(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      qty: qty ?? this.qty,
      price: price ?? this.price,
    );
  }
}
