// =============================================================================
// File        : order_model.dart
// Path        : lib/features/order/data/models/order_model.dart
// Layer       : Data (Model)
// -----------------------------------------------------------------------------
// Fungsi:
// - Model untuk Order
// - Mapping Firestore <-> Entity
// =============================================================================

import 'package:app_laundry/core/extensions/map_list_ext.dart';
import 'package:app_laundry/core/extensions/timestamp_ext.dart';

import 'package:app_laundry/features/order/data/models/order_group_model.dart';

class OrderModel {
  final String id;
  final String invoiceNumber;

  final String customerId;

  final List<OrderGroupModel> groups;
  final String orderStatus;
  final String paymentStatus;

  final int total;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  const OrderModel({
    required this.id,
    required this.invoiceNumber,
    required this.customerId,
    required this.groups,
    required this.orderStatus,
    required this.paymentStatus,
    required this.total,
    this.createdAt,
    this.updatedAt,
  });

  // =========================
  // FROM MAP
  // =========================

  factory OrderModel.fromMap(Map<String, dynamic> map, String id) {
    return OrderModel(
      id: id,
      invoiceNumber: map['invoiceNumber'] ?? '',

      customerId: map['customerId'] ?? '',

      groups: map.toModelList('groups', OrderGroupModel.fromMap),
      orderStatus: map['orderStatus'] ?? '',
      paymentStatus: map['paymentStatus'] ?? '',
      total: map['total'] ?? 0,

      createdAt: map.timestamp('createdAt'),

      updatedAt: map.timestamp('updatedAt'),
    );
  }

  // =========================
  // TO MAP
  // =========================

  Map<String, dynamic> toMap() {
    return {
      'invoiceNumber': invoiceNumber,

      'customerId': customerId,

      'groups': groups.map((e) => e.toMap()).toList(),
      'orderStatus': orderStatus,
      'paymentStatus': paymentStatus,

      'total': total,

      'createdAt': createdAt,

      'updatedAt': updatedAt,
    };
  }
}
