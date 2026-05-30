// =============================================================================
// File        : setting_form_controller.dart
// Path        : lib/features/setting/presentation/controllers/setting_form_controller.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Handle form controller setting aplikasi
// =============================================================================

import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/core/extensions/string_ext.dart';
import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';
import 'package:app_laundry/features/setting/domain/usecases/setting_params.dart';
import 'package:flutter/material.dart';

class SettingFormController extends FormController {
  // =========================
  // CONTROLLERS
  // =========================

  final regularPrice = TextEditingController();
  final expressPrice = TextEditingController();
  final regularEstimation = TextEditingController();
  final expressEstimation = TextEditingController();

  // =========================
  // ENTITY
  // =========================

  late SettingEntity _current;

  // =========================
  // FORM CONTROLLERS
  // =========================

  @override
  List<TextEditingController> get controllers {
    return [regularPrice, expressPrice, regularEstimation, expressEstimation];
  }

  // =========================
  // SET DATA
  // =========================

  void setSetting(SettingEntity setting) {
    _current = setting;
    regularPrice.text = setting.regularPrice.toString();
    expressPrice.text = setting.expressPrice.toString();
    regularEstimation.text = setting.regularEstimation.toString();
    expressEstimation.text = setting.expressEstimation.toString();
  }

  // =========================
  // BUILD PARAMS
  // =========================

  SettingParams buildParams() {
    return SettingParams(
      current: _current,
      regularPrice: regularPrice.text.trim().toIntOrZero,
      expressPrice: expressPrice.text.trim().toIntOrZero,
      regularEstimation: regularEstimation.text.trim().toIntOrZero,
      expressEstimation: expressEstimation.text.trim().toIntOrZero,
    );
  }
}
