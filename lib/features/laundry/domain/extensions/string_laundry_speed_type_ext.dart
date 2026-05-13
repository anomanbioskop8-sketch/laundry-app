// =============================================================================
// File        : string_laundry_service_type_ext.dart
// Path        : lib/features/laundry_price/domain/extensions/string_laundry_service_type_ext.dart
// =============================================================================

import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';

extension StringLaundrySpeedTypeExt on String {
  LaundrySpeedType get toLaundrySpeedType {
    return LaundrySpeedTypeExt.fromString(this);
  }
}
