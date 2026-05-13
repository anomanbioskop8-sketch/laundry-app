import 'package:app_laundry/core/base/form/fields/form_option.dart';

import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';

import 'package:app_laundry/core/base/validators/app_validator.dart';

import 'package:app_laundry/core/constants/order_strings.dart';

import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';

import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';

import 'package:app_laundry/features/order/presentation/controllers/order_form_controller.dart';

import 'package:flutter/material.dart';

class OrderFormConfig {
  final OrderFormController controller;

  final List<CustomerEntity> customers;

  OrderFormConfig({required this.controller, required this.customers});

  // =========================
  // BUILD FIELDS
  // =========================

  List<FormFieldConfig> get fields {
    return [
      // =========================
      // CUSTOMER
      // =========================
      FormFieldConfig(
        name: 'customer',
        label: OrderStrings.customer,
        type: FormFieldType.dropdown,
        controller: controller.customerId,
        options: customers
            .map(
              (e) => FormOption(value: e.id, label: e.name, icon: Icons.person),
            )
            .toList(),
        validators: [
          (v) => AppValidator.required(v, field: OrderStrings.customer),
        ],
      ),

      // =========================
      // SERVICE TYPE
      // =========================
      FormFieldConfig(
        name: 'serviceType',
        label: OrderStrings.serviceType,
        initialValue: false,
        type: FormFieldType.dropdown,
        controller: controller.serviceType,
        options: LaundryServiceType.values
            .map(
              (e) => FormOption(value: e.value, label: e.label, icon: e.icon),
            )
            .toList(),
        validators: [(v) => AppValidator.required(v, field: 'Kategori')],
      ),

      // =========================
      // PAYMENT STATUS
      // =========================
      FormFieldConfig(
        name: 'paymentStatus',
        label: OrderStrings.paymentStatus,
        initialValue: true,
        type: FormFieldType.dropdown,
        controller: controller.paymentStatus,
        options: PaymentStatus.values
            .map(
              (e) => FormOption(value: e.value, label: e.label, icon: e.icon),
            )
            .toList(),
        validators: [(v) => AppValidator.required(v, field: 'Payment')],
      ),
    ];
  }

  // =========================
  // SUBMIT LABEL
  // =========================

  String get submitLabel {
    return OrderStrings.add;
  }
}
