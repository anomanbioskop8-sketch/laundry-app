// =============================================================================
// File        : text_field_widget.dart
// Path        : lib/core/base/form/fields/text_field_widget.dart
// Layer       : Presentation (Reusable Field Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Render Text-based field (text, email, number, password, multiline)
// - Digunakan oleh AppFormFieldRenderer
// =============================================================================

import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:flutter/material.dart';
import '../form_field_config.dart';

class TextFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const TextFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: field.controller,
      keyboardType: field.keyboardType ?? _mapKeyboard(field.type),
      obscureText: field.type == FormFieldType.password || field.obscureText,
      validator: field.validate,
      autofillHints: field.autofillHints,
      maxLines: field.type == FormFieldType.multiline ? 3 : 1,
      decoration: InputDecoration(labelText: field.label),
    );
  }

  /// =========================
  /// KEYBOARD TYPE MAPPER
  /// =========================
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
