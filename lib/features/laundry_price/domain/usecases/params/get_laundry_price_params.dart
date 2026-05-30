// =============================================================================
// File        : get_laundry_price_params.dart
// Path        : lib/features/laundry_price/domain/usecases/get_laundry_price_params.dart
// =============================================================================

import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';

class GetLaundryPriceParams {
  final String itemId;
  final LaundryServiceType serviceType;
  final LaundrySpeedType speedType;

  const GetLaundryPriceParams({
    required this.itemId,
    required this.serviceType,
    required this.speedType,
  });

  bool get isValid => itemId.isNotEmpty;
}
