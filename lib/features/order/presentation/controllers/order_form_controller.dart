import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/string_payment_status_ext.dart';
import 'package:flutter/material.dart';

class OrderFormController extends FormController {
  final customerId = TextEditingController();
  final paymentStatus = TextEditingController();

  /// hanya untuk validasi form
  final groups = TextEditingController();

  @override
  List<TextEditingController> get controllers => [
    customerId,
    paymentStatus,
    groups,
  ];

  OrderFormController() {
    paymentStatus.text = PaymentStatus.unpaid.value;
  }

  void setCustomer(CustomerEntity value) {
    customerId.text = value.id;
  }

  /// update ketika group berubah
  void setGroupsCount(int count) {
    groups.text = count.toString();
  }

  PaymentStatus get selectedPaymentStatus {
    return paymentStatus.text.trim().toPaymentStatus;
  }
}
