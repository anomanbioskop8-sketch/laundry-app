// =============================================================================
// File        : date_field_widget.dart
// Path        : lib/core/base/form/fields/date_field_widget.dart
// Layer       : Presentation (Reusable Field Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Render date picker field
// - Handle DateTime <-> String (controller)
// - Support formatting & initial value
// =============================================================================

import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../form_field_config.dart';

class DateFieldWidget extends StatelessWidget {
  final FormFieldConfig field;

  const DateFieldWidget({super.key, required this.field});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: field.controller,
      readOnly: true,
      validator: field.validate,
      decoration: InputDecoration(
        labelText: field.label,
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () => _pickDate(),
    );
  }

  // =========================
  // DATE PICKER
  // =========================
  Future<void> _pickDate() async {
    final context = AppNavigator.navigatorKey.currentContext!;
    final now = DateTime.now();

    final initialDate = _parseDate(field.controller.text) ?? now;

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      field.controller.text = _formatDate(picked);
    }
  }

  // =========================
  // FORMAT DATE (UI)
  // =========================
  String _formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy', 'id_ID').format(date);
  }

  // =========================
  // PARSE DATE (controller → DateTime)
  // =========================
  DateTime? _parseDate(String value) {
    try {
      return DateFormat('dd MMM yyyy', 'id_ID').parse(value);
    } catch (_) {
      return null;
    }
  }
}
