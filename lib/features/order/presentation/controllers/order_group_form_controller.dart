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
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
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

    serviceType.addListener(_onLaundryTypeChanged);
    speedType.addListener(_onLaundryTypeChanged);
  }

  void _onLaundryTypeChanged() {
    items.clear();
  }

  // =========================
  // TYPES
  // =========================

  LaundryServiceType get selectedServiceType =>
      serviceType.text.toLaundryServiceType;

  LaundrySpeedType get selectedSpeedType => speedType.text.toLaundrySpeedType;

  LaundryOrderType get selectedOrderType => orderType.text.toLaundryOrderType;

  // =========================
  // VALUES
  // =========================

  int get priceValue => int.tryParse(price.text) ?? 5000;

  double get weightValue => double.tryParse(weight.text) ?? 0;

  // =========================
  // TOTAL ITEMS
  // =========================

  int get totalItems => items.fold<int>(0, (sum, item) => sum + item.qty);

  // =========================
  // SUBTOTAL
  // =========================

  int get subtotal {
    if (selectedOrderType.isKg) {
      return (weightValue * priceValue).toInt();
    }

    return totalItems * priceValue;
  }

  // =========================
  // LAUNDRY ITEM PARAMS
  // =========================

  StreamOrderLaundryItemsParams get laundryItemParams {
    return StreamOrderLaundryItemsParams(
      serviceType: selectedServiceType,
      speedType: selectedSpeedType,
    );
  }

  // =========================
  // BUILD ENTITY
  // =========================

  OrderGroupEntity build() {
    return OrderGroupEntity(
      serviceType: selectedServiceType,
      speedType: selectedSpeedType,
      orderType: selectedOrderType,
      items: items,
      weight: selectedOrderType.isKg ? weightValue : 0,
      totalItems: totalItems,
      price: priceValue,
    );
  }
}
