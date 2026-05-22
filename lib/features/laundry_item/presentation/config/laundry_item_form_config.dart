import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/features/laundry_item/domain/extensions/laundry_item_category_ext.dart';
import 'package:app_laundry/features/laundry_item/presentation/controllers/laundry_item_form_controller.dart';
import 'package:flutter/material.dart';

class LaundryItemFormConfig {
  final LaundryItemFormController controller;

  LaundryItemFormConfig(this.controller);

  /// =========================
  /// BUILD FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      FormFieldConfig(
        name: 'name',
        label: LaundryItemStrings.name,
        prefixIcon: Icons.local_laundry_service_outlined,
        controller: controller.name,
        validators: [
          (v) => AppValidator.required(
            v,
            message: LaundryItemStrings.nameRequired,
          ),
          (v) => AppValidator.minLength(v, 3, field: 'Nama'),
        ],
      ),
      FormFieldConfig(
        name: 'category',
        label: LaundryItemStrings.category,
        prefixIcon: Icons.category_outlined,
        initialValue: true,
        type: FormFieldType.dropdown,
        controller: controller.category,
        options: LaundryItemCategoryExt.options,
        validators: [
          (v) => AppValidator.required(
            v,
            message: LaundryItemStrings.categoryRequired,
          ),
        ],
      ),
    ];
  }

  /// =========================
  /// SUBMIT LABEL
  /// =========================
  String get submitLabel {
    return controller.isEdit ? LaundryItemStrings.edit : LaundryItemStrings.add;
  }
}
