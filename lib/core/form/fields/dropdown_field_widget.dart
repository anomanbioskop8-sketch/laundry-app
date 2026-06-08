// =============================================================================
// File        : dropdown_field_widget.dart
// Path        : lib/core/base/form/fields/dropdown_field_widget.dart
// Layer       : Presentation (Reusable Field Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Render dropdown field
// - Support static & dynamic options
// - Integrasi dengan FormFieldConfig
// =============================================================================

import 'package:app_laundry/core/form/extensions/form_option_dropdown_ext.dart';
import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:flutter/material.dart';

class DropdownFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const DropdownFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final options = field.options ?? [];

    return DropdownButtonFormField<String>(
      isExpanded: true,
      items: options.toDropdownItems(),
      validator: field.validate,
      decoration: InputDecoration(
        labelText: field.label,
        contentPadding: EdgeInsets.symmetric(vertical: context.spacing.md),
      ),

      initialValue: field.controller.text.isEmpty
          ? null
          : field.controller.text,
      onChanged: (value) {
        if (value == null) return;
        field.controller.text = value;
        field.onChanged?.call(value);
      },
    );
  }
}
