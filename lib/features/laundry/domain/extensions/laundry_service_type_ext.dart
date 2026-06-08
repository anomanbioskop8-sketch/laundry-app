// features/laundry_price/domain/enums/order_type_ext.dart

import 'package:app_laundry/core/form/fields/form_option.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:flutter/material.dart';

extension LaundryServiceTypeExt on LaundryServiceType {
  String get value {
    switch (this) {
      case LaundryServiceType.wash:
        return 'wash';

      case LaundryServiceType.iron:
        return 'iron';

      case LaundryServiceType.washIron:
        return 'wash_iron';

      case LaundryServiceType.dryClean:
        return 'dry_clean';
    }
  }

  String get label {
    switch (this) {
      case LaundryServiceType.wash:
        return 'Cuci';

      case LaundryServiceType.iron:
        return 'Setrika';

      case LaundryServiceType.washIron:
        return 'Cuci + Setrika';

      case LaundryServiceType.dryClean:
        return 'Dry Clean';
    }
  }

  IconData get icon {
    switch (this) {
      case LaundryServiceType.wash:
        return Icons.local_laundry_service_rounded;

      case LaundryServiceType.iron:
        return Icons.iron_rounded;

      case LaundryServiceType.washIron:
        return Icons.checkroom_rounded;

      case LaundryServiceType.dryClean:
        return Icons.dry_cleaning_rounded;
    }
  }

  static LaundryServiceType fromString(String value) {
    switch (value) {
      case 'iron':
        return LaundryServiceType.iron;

      case 'wash_iron':
        return LaundryServiceType.washIron;

      case 'dry_clean':
        return LaundryServiceType.dryClean;

      default:
        return LaundryServiceType.wash;
    }
  }

  // =========================
  // FORM OPTION
  // =========================

  FormOption get option {
    return FormOption(value: value, label: label, icon: icon);
  }

  // =========================
  // FORM OPTIONS
  // =========================

  static List<FormOption> get options {
    return LaundryServiceType.values.map((e) => e.option).toList();
  }
}
