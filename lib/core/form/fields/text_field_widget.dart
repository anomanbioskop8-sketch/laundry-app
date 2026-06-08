// =============================================================================
// File        : text_field_widget.dart
// Path        : lib/core/base/form/fields/text_field_widget.dart
// Layer       : Presentation (Reusable Field Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Render reusable text-based field
// - Mendukung:
//   - text
//   - email
//   - number
//   - password
//   - multiline
// - Digunakan oleh AppFormFieldRenderer
// =============================================================================

import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:app_laundry/core/form/configs/form_field_type.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const TextFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final isMultiline = field.maxLines != null && field.maxLines! > 1;

    return TextFormField(
      // =========================
      // CONTROLLER
      // =========================
      controller: field.controller,

      // =========================
      // STATE
      // =========================
      enabled: field.enabled,
      readOnly: field.readOnly,
      obscureText: _isObscure,

      // =========================
      // INPUT
      // =========================
      keyboardType: field.keyboardType ?? _mapKeyboard(field.type),
      textInputAction: field.textInputAction,
      autofillHints: field.autofillHints,
      inputFormatters: field.inputFormatters,
      onChanged: field.onChanged,

      // =========================
      // TEXT
      // =========================
      minLines: isMultiline ? field.minLines ?? 3 : 1,
      maxLines: isMultiline ? field.maxLines : 1,
      maxLength: field.maxLength,

      // =========================
      // VALIDATION
      // =========================
      validator: field.validate,

      // =========================
      // UI
      // =========================
      //style: context.bodyLarge?.onSurface(context),
      decoration: InputDecoration(
        labelText: field.displayLabel,
        hintText: field.hintText,

        // 🔥 hanya multiline
        alignLabelWithHint: true,

        // =========================
        // PREFIX ICON
        // =========================
        prefixIcon: field.prefixIcon != null
            ? Padding(
                padding: EdgeInsets.only(bottom: isMultiline ? 48 : 0),
                child: Icon(field.prefixIcon),
              )
            : null,

        // =========================
        // SUFFIX ICON
        // =========================
        suffixIcon: field.suffixIcon != null ? Icon(field.suffixIcon) : null,
      ),
    );
  }

  // =========================
  // PASSWORD CHECK
  // =========================

  bool get _isObscure {
    return field.type == FormFieldType.password || field.obscureText;
  }

  // =========================
  // KEYBOARD TYPE MAPPER
  // =========================

  TextInputType _mapKeyboard(FormFieldType type) {
    switch (type) {
      case FormFieldType.email:
        return TextInputType.emailAddress;

      case FormFieldType.number:
        return TextInputType.number;

      case FormFieldType.multiline:
        return TextInputType.multiline;

      default:
        return TextInputType.text;
    }
  }
}
