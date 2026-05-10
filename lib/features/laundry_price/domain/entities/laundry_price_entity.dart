// features/laundry_price/domain/entities/laundry_price_entity.dart

import 'package:app_laundry/features/laundry_price/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/order_type.dart';

class LaundryPriceEntity {
  final String id;
  final String laundryItemId;
  final OrderType orderType;
  final LaundryServiceType serviceType;
  final int price;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LaundryPriceEntity({
    required this.id,

    required this.laundryItemId,
    required this.orderType,
    required this.serviceType,
    required this.price,
    this.createdAt,
    this.updatedAt,
  });
}
