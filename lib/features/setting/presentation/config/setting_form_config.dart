// =============================================================================
// File        : setting_form_config.dart
// Path        : lib/features/setting/presentation/config/setting_form_config.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Konfigurasi field form setting aplikasi
// =============================================================================

import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/setting_strings.dart';
import 'package:app_laundry/features/setting/presentation/controllers/setting_form_controller.dart';

class SettingFormConfig {
  // =========================
  // DEPENDENCY
  // =========================

  final SettingFormController _controller;

  SettingFormConfig(this._controller);

  // =========================
  // FIELDS
  // =========================

  List<FormFieldConfig> get fields {
    return [
      // =========================
      // REGULAR PRICE
      // =========================
      FormFieldConfig(
        name: 'regularPrice',
        label: 'Harga Regular',
        type: FormFieldType.number,
        controller: _controller.regularPrice,
        prefixIcon: AppIcons.money,
        validators: [
          (v) => AppValidator.required(
            v,
            message: SettingStrings.regularPriceRequired,
          ),
        ],
      ),

      // =========================
      // EXPRESS PRICE
      // =========================
      FormFieldConfig(
        name: 'expressPrice',
        label: 'Harga Express',
        type: FormFieldType.number,
        controller: _controller.expressPrice,
        prefixIcon: AppIcons.money,
        validators: [
          (v) => AppValidator.required(
            v,
            message: SettingStrings.expressPriceRequired,
          ),
        ],
      ),

      // =========================
      // REGULAR ESTIMATION
      // =========================
      FormFieldConfig(
        name: 'regularEstimation',
        label: 'Estimasi Regular (Hari)',
        type: FormFieldType.number,
        controller: _controller.regularEstimation,
        prefixIcon: AppIcons.schedule,
        validators: [
          (v) => AppValidator.required(
            v,
            message: SettingStrings.regularEstimationRequired,
          ),
        ],
      ),

      // =========================
      // EXPRESS ESTIMATION
      // =========================
      FormFieldConfig(
        name: 'expressEstimation',
        label: 'Estimasi Express (Hari)',
        type: FormFieldType.number,
        controller: _controller.expressEstimation,
        prefixIcon: AppIcons.schedule,
        validators: [
          (v) => AppValidator.required(
            v,
            message: SettingStrings.expressEstimationRequired,
          ),
        ],
      ),
    ];
  }
}
