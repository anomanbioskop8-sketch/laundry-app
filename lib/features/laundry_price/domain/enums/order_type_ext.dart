// features/laundry_price/domain/enums/order_type_ext.dart

import 'package:flutter/material.dart';

import 'order_type.dart';

extension OrderTypeX on OrderType {
  String get value {
    switch (this) {
      case OrderType.wash:
        return 'wash';

      case OrderType.iron:
        return 'iron';

      case OrderType.washIron:
        return 'wash_iron';

      case OrderType.dryClean:
        return 'dry_clean';
    }
  }

  String get label {
    switch (this) {
      case OrderType.wash:
        return 'Cuci';

      case OrderType.iron:
        return 'Setrika';

      case OrderType.washIron:
        return 'Cuci + Setrika';

      case OrderType.dryClean:
        return 'Dry Clean';
    }
  }

  IconData get icon {
    switch (this) {
      case OrderType.wash:
        return Icons.local_laundry_service_rounded;

      case OrderType.iron:
        return Icons.iron_rounded;

      case OrderType.washIron:
        return Icons.checkroom_rounded;

      case OrderType.dryClean:
        return Icons.dry_cleaning_rounded;
    }
  }

  static OrderType fromString(String value) {
    switch (value) {
      case 'iron':
        return OrderType.iron;

      case 'wash_iron':
        return OrderType.washIron;

      case 'dry_clean':
        return OrderType.dryClean;

      default:
        return OrderType.wash;
    }
  }
}
