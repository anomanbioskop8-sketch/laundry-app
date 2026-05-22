// =============================================================================
// File        : customer_form_config.dart
// Path        : lib/features/customer/presentation/config/customer_form_config.dart
// Layer       : Presentation (Form Configuration)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan konfigurasi field form customer
// - Mengatur:
//   - nama field
//   - label field
//   - icon field
//   - tipe input
//   - controller
//   - validator
// - Menentukan label tombol submit berdasarkan mode form
//   (Tambah atau Edit)
// - Menjadi central configuration untuk form customer
// =============================================================================

import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/features/customer/presentation/controllers/customer_form_controller.dart';
import 'package:flutter/material.dart';

class CustomerFormConfig {
  final CustomerFormController controller;

  CustomerFormConfig(this.controller);

  /// =========================
  /// BUILD FORM FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      /// =========================
      /// NAME
      /// =========================
      FormFieldConfig(
        name: 'name',
        label: 'Nama',
        hintText: CustomerStrings.nameHint,
        prefixIcon: Icons.person_outline,
        controller: controller.name,
        validators: [
          (v) =>
              AppValidator.required(v, message: CustomerStrings.nameRequired),
          (v) => AppValidator.minLength(v, 3, field: 'Nama'),
        ],
      ),

      /// =========================
      /// PHONE
      /// =========================
      FormFieldConfig(
        name: 'phone',
        label: 'No HP',
        hintText: CustomerStrings.phoneHint,
        prefixIcon: Icons.phone_outlined,
        controller: controller.phone,
        type: FormFieldType.number,
        validators: [AppValidator.phone],
      ),

      /// =========================
      /// ADDRESS
      /// =========================
      FormFieldConfig(
        name: 'address',
        label: 'Alamat',
        controller: controller.address,
        type: FormFieldType.multiline,
        hintText: CustomerStrings.addressHint,
        prefixIcon: Icons.location_on_outlined,
        maxLines: 3,
        validators: [
          (v) => AppValidator.required(
            v,
            message: CustomerStrings.addressRequired,
          ),
        ],
      ),
    ];
  }

  /// =========================
  /// SUBMIT BUTTON LABEL
  /// =========================
  String get submitLabel {
    return controller.isEdit ? CustomerStrings.update : CustomerStrings.create;
  }
}
