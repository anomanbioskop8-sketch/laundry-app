import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class OrderGroupEntity {
  final LaundryServiceType serviceType;
  final LaundrySpeedType speedType;
  final LaundryOrderType orderType;
  final List<OrderLaundryItemEntity> items;
  final Duration estimatedDuration;
  final int unitPrice;
  final double? weight;

  const OrderGroupEntity({
    required this.serviceType,
    required this.speedType,
    required this.orderType,
    required this.items,
    required this.unitPrice,
    required this.estimatedDuration,
    this.weight,
  });

  OrderGroupEntity copyWith({
    LaundryServiceType? serviceType,
    LaundrySpeedType? speedType,
    LaundryOrderType? orderType,
    List<OrderLaundryItemEntity>? items,
    int? totalItems,
    Duration? estimatedDuration,
    int? unitPrice,
    double? weight,
  }) {
    return OrderGroupEntity(
      serviceType: serviceType ?? this.serviceType,
      speedType: speedType ?? this.speedType,
      orderType: orderType ?? this.orderType,
      items: items ?? this.items,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      unitPrice: unitPrice ?? this.unitPrice,
      weight: weight ?? this.weight,
    );
  }
}
