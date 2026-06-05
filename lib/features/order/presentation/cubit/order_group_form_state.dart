import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class OrderGroupFormState {
  final LaundryServiceType serviceType;
  final LaundrySpeedType speedType;
  final LaundryOrderType orderType;

  final List<OrderLaundryItemEntity> items;

  const OrderGroupFormState({
    required this.serviceType,
    required this.speedType,
    required this.orderType,
    this.items = const [],
  });

  OrderGroupFormState copyWith({
    LaundryServiceType? serviceType,
    LaundrySpeedType? speedType,
    LaundryOrderType? orderType,
    List<OrderLaundryItemEntity>? items,
  }) {
    return OrderGroupFormState(
      serviceType: serviceType ?? this.serviceType,
      speedType: speedType ?? this.speedType,
      orderType: orderType ?? this.orderType,
      items: items ?? this.items,
    );
  }
}
