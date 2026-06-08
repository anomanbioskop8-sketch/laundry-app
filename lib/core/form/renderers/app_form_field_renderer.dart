// =============================================================================
// File        : app_form_field_renderer.dart
// Path        : lib/core/base/form/app_form_field_renderer.dart
// Layer       : Presentation (UI Builder)
// -----------------------------------------------------------------------------

import 'package:app_laundry/core/form/fields/checkbox_field_widget.dart';
import 'package:app_laundry/core/form/fields/custom_field_widget.dart';
import 'package:app_laundry/core/form/fields/date_field_widget.dart';
import 'package:app_laundry/core/form/fields/dropdown_field_widget.dart';
import 'package:app_laundry/core/form/fields/text_field_widget.dart';
import 'package:app_laundry/core/form/configs/form_field_type.dart';
import 'package:flutter/material.dart';
import '../configs/form_field_config.dart';

class AppFormFieldRenderer {
  static Widget build(FormFieldConfig f) {
    /// 🔥 custom override (prioritas tertinggi)
    if (f.builder != null) {
      return f.builder!(f);
    }

    switch (f.type) {
      case FormFieldType.text:
      case FormFieldType.email:
      case FormFieldType.number:
      case FormFieldType.password:
      case FormFieldType.multiline:
        return TextFieldWidget(field: f);

      case FormFieldType.dropdown:
        return DropdownFieldWidget(field: f);

      case FormFieldType.date:
        return DateFieldWidget(field: f);

      case FormFieldType.checkbox:
        return CheckboxFieldWidget(field: f);

      case FormFieldType.custom:
        return CustomFieldWidget(field: f);
    }
  }
}
