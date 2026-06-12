// =============================================================================
// File : order_item_model.dart
// =============================================================================

class OrderItemModel {
  final String type;
  final String laundryItemId;
  final String laundryItemName;
  final String orderType;
  final double? weight;
  final int? qty;
  final int price;

  OrderItemModel({
    required this.type,
    required this.laundryItemId,
    required this.laundryItemName,
    required this.orderType,
    this.weight,
    this.qty,
    required this.price,
  });

  // =========================
  // FROM MAP
  // =========================

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    return OrderItemModel(
      type: map['type'] ?? '',
      laundryItemId: map['laundryItemId'] ?? '',
      laundryItemName: map['laundryItemName'] ?? '',
      orderType: map['orderType'] ?? '',
      weight: (map['weight'] as num?)?.toDouble(),
      qty: map['qty'],
      price: map['price'] ?? 0,
    );
  }

  // =========================
  // TO MAP
  // =========================

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'laundryItemId': laundryItemId,
      'laundryItemName': laundryItemName,
      'orderType': orderType,
      'weight': weight,
      'qty': qty,
      'price': price,
    };
  }
}
