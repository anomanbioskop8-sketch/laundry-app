// =============================================================================
// File : order_group_form_config.dart
// =============================================================================

import 'package:app_laundry/core/form/fields/text_field_widget.dart';
import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:app_laundry/core/form/configs/form_field_type.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/presentation/controllers/order_group_form_controller.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_item/order_item_field/order_item_field.dart';
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
      options: LaundryServiceTypeExt.options,
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
      options: LaundrySpeedTypeExt.options,
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
      options: LaundryOrderTypeExt.options,
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
          builder: (context, _, _) {
            final isKg = controller.selectedOrderType.isKg;

            return TextFieldWidget(
              field: FormFieldConfig(
                name: 'weight',
                label: OrderStrings.weight,
                enabled: isKg,
                type: FormFieldType.number,
                controller: controller.weight,
                prefixIcon: AppIcons.weight,
                hintText: OrderStrings.weightHint,
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
            return OrderItemField(
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
