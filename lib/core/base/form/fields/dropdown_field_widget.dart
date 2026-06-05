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

import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';
import '../form_field_config.dart';

class DropdownFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const DropdownFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    final options = field.options ?? [];

    return DropdownButtonFormField<String>(
      isExpanded: true,
      initialValue: field.controller.text.isEmpty
          ? null
          : field.controller.text,

      items: options
          .map(
            (e) => DropdownMenuItem<String>(
              value: e.value,
              child: Row(
                children: [
                  Icon(
                    e.icon,
                    size: context.sizes.iconMd,
                    color: context.primary,
                  ),
                  context.spacing.lg.w,
                  Text(e.label, style: context.labelLarge!.onSurface(context)),
                ],
              ),
            ),
          )
          .toList(),

      onChanged: (value) {
        if (value == null) return;

        field.controller.text = value;

        field.onChanged?.call(value);
      },
      validator: field.validate,
      hint: Text(
        field.label,
        textDirection: TextDirection.ltr,
        style: context.bodyMedium?.copyWith(
          color: context.colors.onSurfaceVariant.withValues(alpha: 0.5),
        ),
      ),
      decoration: InputDecoration(labelText: field.label),
    );
  }
}
