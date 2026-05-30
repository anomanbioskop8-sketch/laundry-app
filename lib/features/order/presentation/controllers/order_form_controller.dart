import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

import 'package:app_laundry/features/order/domain/enums/payment_status.dart';

import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';

import 'package:app_laundry/features/order/domain/extensions/string_payment_status_ext.dart';

import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';

import 'package:flutter/material.dart';

class OrderFormController extends FormController {
  // =========================
  // CONTROLLERS
  // =========================

  final customerId = TextEditingController();

  final paymentStatus = TextEditingController();

  // =========================
  // SELECTED CUSTOMER
  // =========================

  CustomerEntity? customer;

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
  // SET CUSTOMER
  // =========================

  void setCustomer(CustomerEntity value) {
    customer = value;
    customerId.text = value.id;
  }

  // =========================
  // PAYMENT STATUS
  // =========================

  PaymentStatus get selectedPaymentStatus {
    return paymentStatus.text.trim().toPaymentStatus;
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
    final selectedCustomer = customer;

    if (selectedCustomer == null) {
      throw Exception('Customer belum dipilih');
    }
    return CreateOrderParams(
      customer: selectedCustomer,

      groups: groups,

      paymentStatus: selectedPaymentStatus,
    );
  }
}
