import 'package:app_laundry/core/base/form/fields/form_option.dart';

import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';

import 'package:app_laundry/core/base/validators/app_validator.dart';

import 'package:app_laundry/core/constants/order_strings.dart';

import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';

import 'package:app_laundry/features/order/presentation/controllers/order_form_controller.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group_field_widget.dart';

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

      FormFieldConfig(
        name: 'groups',
        label: '',
        type: FormFieldType.custom,
        controller: TextEditingController(),
        customBuilder: (context) {
          return OrderGroupFieldWidget(
            groups: controller.groups,

            onChanged: (value) {
              controller.groups = value;
            },
          );
        },
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
