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

import 'package:flutter/material.dart';
import '../form_field_config.dart';

class DropdownFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const DropdownFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final options = field.options ?? [];

    return DropdownButtonFormField<String>(
      initialValue: field.controller.text.isEmpty
          ? null
          : field.controller.text,

      items: options
          .map(
            (e) => DropdownMenuItem<String>(
              value: e.value,
              child: Row(
                children: [
                  Icon(e.icon, size: 18),
                  const SizedBox(width: 8),
                  Text(e.label),
                ],
              ),
            ),
          )
          .toList(),

      onChanged: (value) {
        field.controller.text = value ?? '';
      },

      validator: field.validate,

      decoration: InputDecoration(labelText: field.label),
    );
  }
}
