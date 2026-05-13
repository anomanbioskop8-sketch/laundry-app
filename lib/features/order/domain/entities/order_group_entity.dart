import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class OrderGroupEntity {
  // =========================
  // SERVICE
  // =========================

  final LaundryServiceType serviceType;

  final LaundrySpeedType speedType;

  final LaundryOrderType orderType;

  // =========================
  // ITEMS
  // =========================

  final List<OrderLaundryItemEntity> items;

  // =========================
  // QTY
  // =========================

  // untuk KG
  final double? weight;

  // total item fisik
  final int totalItems;

  // =========================
  // PRICE
  // =========================

  final int price;

  final int subtotal;

  const OrderGroupEntity({
    required this.serviceType,

    required this.speedType,

    required this.orderType,

    required this.items,

    this.weight,

    required this.totalItems,

    required this.price,

    required this.subtotal,
  });
}
