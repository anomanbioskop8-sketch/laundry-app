// =============================================================================
// File        : checkbox_field_widget.dart
// Path        : lib/core/base/form/fields/checkbox_field_widget.dart
// Layer       : Presentation (Reusable Field Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Checkbox dengan state management yang benar (ValueNotifier)
// - Sinkron dengan FormBuilder
// =============================================================================

import 'package:flutter/material.dart';
import '../form_field_config.dart';

class CheckboxFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const CheckboxFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final controller = field.boolController;

    if (controller == null) {
      throw Exception(
        'CheckboxField membutuhkan boolController pada FormFieldConfig',
      );
    }

    return ValueListenableBuilder<bool>(
      valueListenable: controller,
      builder: (context, value, _) {
        return CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(field.label),
          value: value,
          onChanged: (val) {
            if (val != null) {
              controller.setValue(val);
            }
          },
        );
      },
    );
  }
}
