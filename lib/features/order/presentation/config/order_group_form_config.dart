// =============================================================================
// File : order_group_form_config.dart
// =============================================================================

import 'package:app_laundry/core/base/form/fields/form_option.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/order/presentation/controllers/order_group_form_controller.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_laundry_item_field_widget.dart';
import 'package:flutter/material.dart';

class OrderGroupFormConfig {
  final OrderGroupFormController controller;

  OrderGroupFormConfig(this.controller);

  // =========================
  // BUILD FIELDS
  // =========================

  List<FormFieldConfig> get fields {
    return [
      // =========================
      // SERVICE TYPE
      // =========================
      FormFieldConfig(
        name: 'serviceType',
        label: OrderStrings.serviceType,
        type: FormFieldType.dropdown,
        controller: controller.serviceType,
        options: LaundryServiceType.values
            .map(
              (e) => FormOption(value: e.value, label: e.label, icon: e.icon),
            )
            .toList(),
        validators: [
          (v) => AppValidator.required(
            v,
            message: OrderStrings.serviceTypeRequired,
          ),
        ],
      ),

      // =========================
      // SPEED TYPE
      // =========================
      FormFieldConfig(
        name: 'speedType',
        label: OrderStrings.speedType,
        type: FormFieldType.dropdown,
        controller: controller.speedType,
        options: LaundrySpeedType.values
            .map(
              (e) => FormOption(value: e.value, label: e.label, icon: e.icon),
            )
            .toList(),
        validators: [
          (v) =>
              AppValidator.required(v, message: OrderStrings.speedTypeRequired),
        ],
      ),

      // =========================
      // ORDER TYPE
      // =========================
      FormFieldConfig(
        name: 'orderType',
        label: OrderStrings.orderType,
        type: FormFieldType.dropdown,
        controller: controller.orderType,
        options: LaundryOrderType.values
            .map(
              (e) => FormOption(value: e.value, label: e.label, icon: e.icon),
            )
            .toList(),
        validators: [
          (v) =>
              AppValidator.required(v, message: OrderStrings.orderTypeRequired),
        ],
      ),

      // =========================
      // WEIGHT
      // =========================
      FormFieldConfig(
        name: 'weight',
        label: OrderStrings.weight,
        controller: controller.weight,
        prefixIcon: AppIcons.weight,
        hintText: OrderStrings.weightHint,
        type: FormFieldType.number,
      ),

      FormFieldConfig(
        name: 'groups',
        label: '',
        type: FormFieldType.custom,
        controller: TextEditingController(),
        customBuilder: (context) {
          return OrderLaundryItemFieldWidget(
            items: controller.items,
            onChanged: (items) {
              controller.items = items;
            },
          );
        },
        // validators: [
        //   (_) => AppValidator.requiredCollection(
        //     controller.items,
        //     message: OrderStrings.orderGroupRequired,
        //   ),
        // ],
      ),
    ];
  }
}
