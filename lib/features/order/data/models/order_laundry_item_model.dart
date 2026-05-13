// =============================================================================
// File        : order_laundry_item_model.dart
// Path        : lib/features/order/data/models/order_laundry_item_model.dart
// Layer       : Data (Model)
// -----------------------------------------------------------------------------
// Fungsi:
// - Model item laundry pada order
// - Mapping Firestore <-> Entity
// =============================================================================

class OrderLaundryItemModel {
  final String laundryItemId;

  final String laundryItemName;

  final int quantity;

  const OrderLaundryItemModel({
    required this.laundryItemId,

    required this.laundryItemName,

    required this.quantity,
  });

  // =========================
  // FROM MAP
  // =========================

  factory OrderLaundryItemModel.fromMap(Map<String, dynamic> map) {
    return OrderLaundryItemModel(
      laundryItemId: map['laundryItemId'] ?? '',

      laundryItemName: map['laundryItemName'] ?? '',

      quantity: map['quantity'] ?? 0,
    );
  }

  // =========================
  // TO MAP
  // =========================

  Map<String, dynamic> toMap() {
    return {
      'laundryItemId': laundryItemId,

      'laundryItemName': laundryItemName,

      'quantity': quantity,
    };
  }
}
