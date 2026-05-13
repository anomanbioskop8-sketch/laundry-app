// features/laundry_price/domain/usecases/laundry_price_params.dart

import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';

class SaveLaundryPriceParams {
  final String? id;

  final String laundryItemId;

  final LaundrySpeedType speedType;

  final LaundryServiceType serviceType;

  final int price;

  const SaveLaundryPriceParams({
    this.id,
    required this.laundryItemId,
    required this.speedType,
    required this.serviceType,
    required this.price,
  });
}

class DeleteLaundryPriceParams {
  final String id;

  const DeleteLaundryPriceParams({required this.id});
}

class DeleteLaundryPriceByItemIdParams {
  final String itemId;

  const DeleteLaundryPriceByItemIdParams({required this.itemId});
}
