// features/laundry_price/data/models/laundry_price_model.dart

import 'package:app_laundry/core/extensions/timestamp_ext.dart';

class LaundryPriceModel {
  final String id;
  final String laundryItemId;
  final String orderType;
  final String serviceType;
  final int price;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LaundryPriceModel({
    required this.id,

    required this.laundryItemId,
    required this.orderType,
    required this.serviceType,
    required this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory LaundryPriceModel.fromMap(Map<String, dynamic> map, String id) {
    return LaundryPriceModel(
      id: id,
      laundryItemId: map['laundryItemId'] ?? '',
      orderType: map['orderType'] ?? '',
      serviceType: map['serviceType'] ?? '',
      price: map['price'] ?? 0,
      createdAt: map.timestamp('createdAt'),
      updatedAt: map.timestamp('updatedAt'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'laundryItemId': laundryItemId,
      'orderType': orderType,
      'serviceType': serviceType,
      'price': price,
    };
  }
}
