// =============================================================================
// File        : string_laundry_service_type_ext.dart
// Path        : lib/features/laundry_price/domain/extensions/string_laundry_service_type_ext.dart
// =============================================================================

import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';

extension StringLaundryServiceTypeExt on String {
  LaundryServiceType get toLaundryServiceType {
    return LaundryServiceTypeExt.fromString(this);
  }
}
