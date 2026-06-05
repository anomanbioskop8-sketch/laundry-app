// =============================================================================
// File        : order_group_model.dart
// Path        : lib/features/order/data/models/order_group_model.dart
// Layer       : Data (Model)
// -----------------------------------------------------------------------------
// Fungsi:
// - Model untuk group order laundry
// - Mapping Firestore <-> Entity
// =============================================================================

import 'package:app_laundry/core/extensions/map_list_ext.dart';
import 'package:app_laundry/features/order/data/models/order_laundry_item_model.dart';

class OrderGroupModel {
  final String serviceType;
  final String speedType;
  final String orderType;
  final List<OrderLaundryItemModel> items;
  final double? weight;
  final int price;

  const OrderGroupModel({
    required this.serviceType,
    required this.speedType,
    required this.orderType,
    required this.items,
    required this.price,
    this.weight,
  });

  // =========================
  // FROM MAP
  // =========================

  factory OrderGroupModel.fromMap(Map<String, dynamic> map) {
    return OrderGroupModel(
      serviceType: map['serviceType'] ?? '',
      speedType: map['speedType'] ?? '',
      orderType: map['orderType'] ?? '',
      items: map.toModelList('items', OrderLaundryItemModel.fromMap),
      weight: (map['weight'] as num?)?.toDouble(),
      price: map['price'] ?? 0,
    );
  }

  // =========================
  // TO MAP
  // =========================

  Map<String, dynamic> toMap() {
    return {
      'serviceType': serviceType,
      'speedType': speedType,
      'orderType': orderType,
      'items': items.map((e) => e.toMap()).toList(),
      'weight': weight,
      'price': price,
    };
  }
}
