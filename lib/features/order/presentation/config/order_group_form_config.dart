// =============================================================================
// File : order_group_form_config.dart
// =============================================================================

import 'package:app_laundry/core/base/form/extensions/form_option_ext.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/controllers/order_group_form_controller.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_laundry_item_field/order_laundry_item_field_widget.dart';
import 'package:flutter/material.dart';

class OrderGroupFormConfig {
  final OrderGroupFormController controller;
  final VoidCallback onLaundryTypeChanged;

  OrderGroupFormConfig({
    required this.controller,
    required this.onLaundryTypeChanged,
  });

  List<FormFieldConfig> get fields => [
    _serviceTypeField,
    _speedTypeField,
    _orderTypeField,
    _weightField,
    _itemsField,
  ];

  // =========================
  // SERVICE TYPE
  // =========================

  FormFieldConfig get _serviceTypeField {
    return FormFieldConfig(
      name: 'serviceType',
      label: OrderStrings.serviceType,
      type: FormFieldType.dropdown,
      controller: controller.serviceType,
      options: LaundryServiceType.values.toFormOptions(
        value: (e) => e.value,
        label: (e) => e.label,
        icon: (e) => e.icon,
      ),
      onChanged: (_) => onLaundryTypeChanged(),
    );
  }

  // =========================
  // SPEED TYPE
  // =========================

  FormFieldConfig get _speedTypeField {
    return FormFieldConfig(
      name: 'speedType',
      label: OrderStrings.speedType,
      type: FormFieldType.dropdown,
      controller: controller.speedType,
      options: LaundrySpeedType.values.toFormOptions(
        value: (e) => e.value,
        label: (e) => e.label,
        icon: (e) => e.icon,
      ),
      onChanged: (_) => onLaundryTypeChanged(),
    );
  }

  // =========================
  // ORDER TYPE
  // =========================

  FormFieldConfig get _orderTypeField {
    return FormFieldConfig(
      name: 'orderType',
      label: OrderStrings.orderType,
      type: FormFieldType.dropdown,
      controller: controller.orderType,
      options: LaundryOrderType.values.toFormOptions(
        value: (e) => e.value,
        label: (e) => e.label,
        icon: (e) => e.icon,
      ),
    );
  }

  // =========================
  // WEIGHT
  // =========================

  FormFieldConfig get _weightField {
    return FormFieldConfig(
      name: 'weight',
      label: OrderStrings.weight,
      controller: controller.weight,
      type: FormFieldType.custom,
      customBuilder: (_) {
        return ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller.orderType,
          builder: (_, _, _) {
            final isKg = controller.selectedOrderType.isKg;

            return TextFormField(
              controller: controller.weight,
              enabled: isKg,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: OrderStrings.weight,
                hintText: OrderStrings.weightHint,
                prefixIcon: Icon(AppIcons.weight),
              ),
            );
          },
        );
      },
    );
  }

  FormFieldConfig get _itemsField {
    return FormFieldConfig(
      name: 'items',
      label: '',
      type: FormFieldType.custom,
      controller: TextEditingController(),
      customBuilder: (_) {
        return ListenableBuilder(
          listenable: Listenable.merge([
            controller.serviceType,
            controller.speedType,
            controller.orderType,
          ]),
          builder: (_, _) {
            return OrderLaundryItemFieldWidget(
              params: StreamOrderLaundryItemsParams(
                serviceType: controller.selectedServiceType,
                speedType: controller.selectedSpeedType,
              ),
            );
          },
        );
      },
    );
  }
}
