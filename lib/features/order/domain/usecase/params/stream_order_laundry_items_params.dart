import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';

class StreamOrderLaundryItemsParams {
  final LaundryServiceType serviceType;
  final LaundrySpeedType speedType;

  const StreamOrderLaundryItemsParams({
    required this.serviceType,
    required this.speedType,
  });
}
