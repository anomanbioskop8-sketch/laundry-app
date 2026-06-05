import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_speed_type_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupFormController extends FormController {
  final serviceType = TextEditingController();
  final speedType = TextEditingController();
  final orderType = TextEditingController();

  final weight = TextEditingController();

  OrderGroupFormController() {
    serviceType.text = 'wash';
    speedType.text = 'regular';
    orderType.text = 'pcs';
    weight.text = '0';
  }

  @override
  List<TextEditingController> get controllers => [
    serviceType,
    speedType,
    orderType,
    weight,
  ];

  LaundryOrderType get selectedOrderType => orderType.text.toLaundryOrderType;

  LaundryServiceType get selectedServiceType =>
      serviceType.text.toLaundryServiceType;

  LaundrySpeedType get selectedSpeedType => speedType.text.toLaundrySpeedType;

  double get weightValue => double.tryParse(weight.text) ?? 0;
}
