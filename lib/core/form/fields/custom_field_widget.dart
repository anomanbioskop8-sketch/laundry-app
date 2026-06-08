// =============================================================================
// File        : custom_field_widget.dart
// Path        : lib/core/base/form/fields/custom_field_widget.dart
// =============================================================================

import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:flutter/material.dart';

class CustomFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const CustomFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    if (field.customBuilder == null) {
      return const SizedBox.shrink();
    }

    return field.customBuilder!(context);
  }
}
