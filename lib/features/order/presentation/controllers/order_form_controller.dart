import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';

import 'package:app_laundry/features/order/domain/usecase/order_params.dart';

import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_service_type_ext.dart';

import 'package:app_laundry/features/order/domain/extensions/string_payment_status_ext.dart';

import 'package:flutter/material.dart';

class OrderFormController extends FormController {
  // =========================
  // CONTROLLERS
  // =========================

  final customerId = TextEditingController();
  final serviceType = TextEditingController();
  final paymentStatus = TextEditingController();

  // =========================
  // FORM CONTROLLERS
  // =========================

  @override
  List<TextEditingController> get controllers => [
    customerId,
    serviceType,
    paymentStatus,
  ];

  // =========================
  // INITIALIZE
  // =========================

  OrderFormController() {
    serviceType.text = LaundryServiceType.dryClean.value;
    paymentStatus.text = PaymentStatus.unpaid.value;
  }

  // =========================
  // BUILD PARAMS
  // =========================

  CreateOrderParams buildParams() {
    return CreateOrderParams(
      customerId: customerId.text.trim(),
      groups: [],
      serviceType: serviceType.text.trim().toLaundryServiceType,
      paymentStatus: paymentStatus.text.trim().toPaymentStatus,
    );
  }
}
