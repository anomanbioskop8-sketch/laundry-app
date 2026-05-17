// =============================================================================
// File        : form_field_config.dart
// Path        : lib/core/base/form/form_field_config.dart
// Layer       : Core (Reusable Form)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menjadi konfigurasi utama untuk field pada FormBuilder
// - Menyimpan seluruh metadata field:
//   - name
//   - label
//   - controller
//   - validator
//   - tipe field
//   - icon
//   - dropdown options
//   - custom widget builder
// - Digunakan oleh AppFormFieldRenderer untuk menentukan widget field
// - Mendukung:
//   - TextField
//   - Dropdown
//   - Checkbox
//   - DatePicker
//   - Custom Widget
// =============================================================================

import 'package:app_laundry/core/base/form/controllers/bool_controller.dart';
import 'package:app_laundry/core/base/form/fields/form_option.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef Validator = String? Function(String? value);

class FormFieldConfig {
  // =========================
  // REQUIRED
  // =========================

  final String name;
  final String label;
  final TextEditingController controller;

  // =========================
  // FIELD CONFIG
  // =========================

  final FormFieldType type;
  final List<Validator> validators;
  final bool visible;
  final bool enabled;
  final bool readOnly;
  final bool required;

  // =========================
  // INPUT CONFIG
  // =========================
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  // =========================
  // DROPDOWN
  // =========================
  final List<FormOption>? options;

  // =========================
  // CHECKBOX
  // =========================

  final bool? initialValue;
  final BoolController? boolController;

  // =========================
  // CUSTOM
  // =========================

  final Widget Function(FormFieldConfig field)? builder;
  final Widget Function(BuildContext context)? customBuilder;

  // =========================
  // CONSTRUCTOR
  // =========================

  FormFieldConfig({
    required this.name,
    required this.label,
    required this.controller,

    this.type = FormFieldType.text,
    this.validators = const [],

    this.visible = true,
    this.enabled = true,
    this.readOnly = false,
    this.required = false,

    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.autofillHints,
    this.inputFormatters,
    this.onChanged,

    this.options,

    this.initialValue,
    this.boolController,

    this.builder,
    this.customBuilder,
  });

  // =========================
  // VALIDATE
  // =========================

  /// Validate value menggunakan validator list
  String? validate(String? value) {
    for (final validator in validators) {
      final result = validator(value);

      if (result != null) {
        return result;
      }
    }

    return null;
  }

  /// Validate menggunakan current controller value
  String? validateValue() {
    return validate(controller.text);
  }

  // =========================
  // VALUE
  // =========================

  /// Current controller value
  String get value => controller.text;

  // =========================
  // HELPERS
  // =========================

  /// Label with required indicator
  String get displayLabel {
    if (required) {
      return '$label *';
    }

    return label;
  }
}
