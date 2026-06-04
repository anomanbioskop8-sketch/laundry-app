import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class OrderGroupEntity {
  final LaundryServiceType serviceType;
  final LaundrySpeedType speedType;
  final LaundryOrderType orderType;
  final List<OrderLaundryItemEntity> items;
  final double? weight;
  final int totalItems;
  final int price;

  const OrderGroupEntity({
    required this.serviceType,
    required this.speedType,
    required this.orderType,
    required this.items,
    required this.totalItems,
    required this.price,
    this.weight,
  });

  OrderGroupEntity copyWith({
    LaundryServiceType? serviceType,
    LaundrySpeedType? speedType,
    LaundryOrderType? orderType,
    List<OrderLaundryItemEntity>? items,
    double? weight,
    int? totalItems,
    int? price,
  }) {
    return OrderGroupEntity(
      serviceType: serviceType ?? this.serviceType,
      speedType: speedType ?? this.speedType,
      orderType: orderType ?? this.orderType,
      items: items ?? this.items,
      weight: weight ?? this.weight,
      totalItems: totalItems ?? this.totalItems,
      price: price ?? this.price,
    );
  }
}
