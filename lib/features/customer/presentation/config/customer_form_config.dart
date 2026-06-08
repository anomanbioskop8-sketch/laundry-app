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

import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:app_laundry/core/form/configs/form_field_type.dart';
import 'package:app_laundry/core/form/validators/app_validator.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/features/customer/presentation/controllers/customer_form_controller.dart';

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
        label: CustomerStrings.name,
        controller: controller.name,
        prefixIcon: AppIcons.user,
        hintText: CustomerStrings.nameHint,
        validators: [
          (v) =>
              AppValidator.required(v, message: CustomerStrings.nameRequired),
          (v) => AppValidator.minLength(v, 3, field: CustomerStrings.name),
        ],
      ),

      /// =========================
      /// PHONE
      /// =========================
      FormFieldConfig(
        name: 'phone',
        label: CustomerStrings.phone,
        controller: controller.phone,
        prefixIcon: AppIcons.phone,
        hintText: CustomerStrings.phoneHint,
        type: FormFieldType.number,
        validators: [AppValidator.phone],
      ),

      /// =========================
      /// ADDRESS
      /// =========================
      FormFieldConfig(
        name: 'address',
        label: CustomerStrings.address,
        controller: controller.address,
        prefixIcon: AppIcons.address,
        hintText: CustomerStrings.addressHint,
        maxLines: 3,
        type: FormFieldType.multiline,
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
