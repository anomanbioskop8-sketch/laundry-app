import 'package:app_laundry/core/saas/config/field_config.dart';
import 'package:flutter/material.dart';

class AutoField extends StatelessWidget {
  final FieldConfig config;
  final Function(String, dynamic) onChanged;

  const AutoField({super.key, required this.config, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    switch (config.type) {
      case FieldType.text:
        return TextField(
          decoration: InputDecoration(labelText: config.label),
          onChanged: (v) => onChanged(config.name, v),
        );

      case FieldType.phone:
        return TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(labelText: config.label),
          onChanged: (v) => onChanged(config.name, v),
        );

      case FieldType.textarea:
        return TextField(
          maxLines: 3,
          decoration: InputDecoration(labelText: config.label),
          onChanged: (v) => onChanged(config.name, v),
        );

      case FieldType.dropdown:
        return DropdownButtonFormField(
          items: config.options!
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: (v) => onChanged(config.name, v),
        );

      default:
        return const SizedBox();
    }
  }
}
