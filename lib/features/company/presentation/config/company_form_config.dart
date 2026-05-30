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
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/company_strings.dart';
import 'package:app_laundry/features/company/presentation/controllers/company_form_controller.dart';

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
        label: CompanyStrings.name,
        controller: _controller.name,
        prefixIcon: AppIcons.company,
        hintText: CompanyStrings.nameHint,
        validators: [
          (v) => AppValidator.required(v, message: CompanyStrings.nameRequired),
        ],
      ),

      FormFieldConfig(
        name: 'phone',
        label: CompanyStrings.phone,
        controller: _controller.phone,
        prefixIcon: AppIcons.phone,
        hintText: CompanyStrings.phoneHint,
        type: FormFieldType.number,
        validators: [
          (v) =>
              AppValidator.required(v, message: CompanyStrings.phoneRequired),
        ],
      ),

      FormFieldConfig(
        name: 'address',
        label: CompanyStrings.address,
        controller: _controller.address,
        prefixIcon: AppIcons.address,
        hintText: CompanyStrings.addressHint,
        maxLines: 3,
        type: FormFieldType.multiline,
        validators: [
          (v) =>
              AppValidator.required(v, message: CompanyStrings.addressRequired),
        ],
      ),
    ];
  }
}
