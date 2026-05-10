// features/laundry_price/domain/enums/laundry_service_type_ext.dart

import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';
import 'package:flutter/material.dart';

import 'laundry_service_type.dart';

extension LaundryServiceTypeX on LaundryServiceType {
  String get value {
    switch (this) {
      case LaundryServiceType.regular:
        return 'regular';

      case LaundryServiceType.express:
        return 'express';

      case LaundryServiceType.sameDay:
        return 'same_day';
    }
  }

  String get label {
    switch (this) {
      case LaundryServiceType.regular:
        return 'Regular';

      case LaundryServiceType.express:
        return 'Express';

      case LaundryServiceType.sameDay:
        return 'Same Day';
    }
  }

  /// =========================
  /// COLOR
  /// =========================

  Color get color {
    switch (this) {
      case LaundryServiceType.regular:
        return AppSemanticColors.info;

      case LaundryServiceType.express:
        return AppSemanticColors.warning;

      case LaundryServiceType.sameDay:
        return AppSemanticColors.success;
    }
  }

  int get estimationHours {
    switch (this) {
      case LaundryServiceType.regular:
        return 48;

      case LaundryServiceType.express:
        return 24;

      case LaundryServiceType.sameDay:
        return 6;
    }
  }

  static LaundryServiceType fromString(String value) {
    switch (value) {
      case 'express':
        return LaundryServiceType.express;

      case 'same_day':
        return LaundryServiceType.sameDay;

      default:
        return LaundryServiceType.regular;
    }
  }
}
