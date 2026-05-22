// =============================================================================
// File        : company_form_config.dart
// Path        : lib/features/company/presentation/config/company_form_config.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Konfigurasi field form company
// =============================================================================

import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/core/constants/strings/company_strings.dart';

import 'package:app_laundry/features/company/presentation/controllers/company_form_controller.dart';

import 'package:flutter/material.dart';

class CompanyFormConfig {
  final CompanyFormController _controller;

  CompanyFormConfig(this._controller);

  // =========================
  // FIELDS
  // =========================

  List<FormFieldConfig> get fields {
    return [
      FormFieldConfig(
        name: 'name',
        label: 'Nama Company',
        controller: _controller.name,
        prefixIcon: Icons.business_outlined,
        validators: [
          (v) => AppValidator.required(v, message: CompanyStrings.nameRequired),
        ],
      ),

      FormFieldConfig(
        name: 'phone',
        label: 'Phone',
        type: FormFieldType.number,
        controller: _controller.phone,
        prefixIcon: Icons.phone_outlined,
        validators: [
          (v) =>
              AppValidator.required(v, message: CompanyStrings.phoneRequired),
        ],
      ),

      FormFieldConfig(
        name: 'address',
        label: 'Address',
        type: FormFieldType.multiline,
        controller: _controller.address,
        prefixIcon: Icons.location_on_outlined,
        maxLines: 3,
        validators: [
          (v) =>
              AppValidator.required(v, message: CompanyStrings.addressRequired),
        ],
      ),
    ];
  }
}
