import 'package:flutter/material.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/features/customer/presentation/controllers/customer_form_controller.dart';

class CustomerFormConfig {
  final CustomerFormController controller;

  CustomerFormConfig(this.controller);

  /// =========================
  /// BUILD FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      FormFieldConfig(
        name: 'name',
        label: 'Nama',
        controller: controller.name,
        validators: [
          (v) => AppValidator.required(v, field: 'Nama'),
          (v) => AppValidator.minLength(v, 3, field: 'Nama'),
        ],
      ),
      FormFieldConfig(
        name: 'phone',
        label: 'No HP',
        controller: controller.phone,
        keyboardType: TextInputType.phone,
        validators: [AppValidator.phone],
      ),
    ];
  }

  /// =========================
  /// SUBMIT LABEL
  /// =========================
  String get submitLabel {
    return controller.isEdit ? 'Update' : 'Create';
  }
}
