// =============================================================================
// File : order_group_form_controller.dart
// =============================================================================

import 'package:app_laundry/core/base/form/controllers/form_controller.dart';

import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';

import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';

import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';

import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_order_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_service_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_speed_type_ext.dart';

import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

import 'package:flutter/material.dart';

class OrderGroupFormController extends FormController {
  // =========================
  // CONTROLLERS
  // =========================

  final serviceType = TextEditingController();

  final speedType = TextEditingController();

  final orderType = TextEditingController();

  final weight = TextEditingController();

  final price = TextEditingController();

  // =========================
  // ITEMS
  // =========================

  List<OrderLaundryItemEntity> items = [];

  // =========================
  // FORM CONTROLLERS
  // =========================

  @override
  List<TextEditingController> get controllers => [
    serviceType,
    speedType,
    orderType,
    weight,
    price,
  ];

  // =========================
  // INITIALIZE
  // =========================

  OrderGroupFormController() {
    serviceType.text = LaundryServiceType.wash.value;

    speedType.text = LaundrySpeedType.regular.value;

    orderType.text = LaundryOrderType.pcs.value;
  }

  // =========================
  // TOTAL ITEMS
  // =========================

  int get totalItems {
    return items.fold<int>(0, (sum, e) => sum + e.qty);
  }

  // =========================
  // SUBTOTAL
  // =========================

  int get subtotal {
    final priceValue = int.tryParse(price.text) ?? 0;

    final type = orderType.text.toLaundryOrderType;

    if (type.isKg) {
      final weightValue = double.tryParse(weight.text) ?? 0;

      return (weightValue * priceValue).toInt();
    }

    return totalItems * priceValue;
  }

  // =========================
  // BUILD ENTITY
  // =========================

  OrderGroupEntity build() {
    return OrderGroupEntity(
      serviceType: serviceType.text.toLaundryServiceType,

      speedType: speedType.text.toLaundrySpeedType,

      orderType: orderType.text.toLaundryOrderType,

      items: items,

      weight: orderType.text.toLaundryOrderType.isKg
          ? double.tryParse(weight.text)
          : null,

      totalItems: totalItems,

      price: int.tryParse(price.text) ?? 0,

      subtotal: subtotal,
    );
  }
}
