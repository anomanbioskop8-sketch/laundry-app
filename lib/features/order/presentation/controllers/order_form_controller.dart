import 'package:app_laundry/core/base/form/controllers/form_controller.dart';

import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

import 'package:app_laundry/features/order/domain/enums/payment_status.dart';

import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';

import 'package:app_laundry/features/order/domain/extensions/string_payment_status_ext.dart';

import 'package:app_laundry/features/order/domain/usecase/order_params.dart';

import 'package:flutter/material.dart';

class OrderFormController extends FormController {
  // =========================
  // CONTROLLERS
  // =========================

  final customerId = TextEditingController();

  final paymentStatus = TextEditingController();

  // =========================
  // GROUPS
  // =========================

  List<OrderGroupEntity> groups = [];

  // =========================
  // FORM CONTROLLERS
  // =========================

  @override
  List<TextEditingController> get controllers => [customerId, paymentStatus];

  // =========================
  // INITIALIZE
  // =========================

  OrderFormController() {
    paymentStatus.text = PaymentStatus.unpaid.value;
  }

  // =========================
  // TOTAL
  // =========================

  int get total {
    return groups.fold<int>(0, (sum, e) => sum + e.subtotal);
  }

  // =========================
  // BUILD PARAMS
  // =========================

  CreateOrderParams buildParams() {
    return CreateOrderParams(
      customerId: customerId.text.trim(),

      groups: groups,

      paymentStatus: paymentStatus.text.trim().toPaymentStatus,
    );
  }
}
