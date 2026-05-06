import 'package:app_laundry/core/base/form/controllers/bool_controller.dart';
import 'package:app_laundry/core/base/form/fields/form_option.dart';
import 'package:app_laundry/core/base/form/form_field_type.dart';
import 'package:flutter/material.dart';

typedef Validator = String? Function(String? value);

class FormFieldConfig {
  final String name;
  final String label;
  final TextEditingController controller;
  final List<Validator> validators;

  final FormFieldType type;

  /// optional configs
  final TextInputType? keyboardType;
  final bool obscureText;
  final Iterable<String>? autofillHints;

  /// dropdown
  final List<FormOption>? options;

  /// checkbox
  final bool? initialValue;
  final BoolController? boolController;

  /// custom widget (ultimate flexibility)
  final Widget Function(FormFieldConfig field)? builder;

  FormFieldConfig({
    required this.name,
    required this.label,
    required this.controller,
    this.validators = const [],

    this.type = FormFieldType.text,
    this.keyboardType,
    this.obscureText = false,
    this.autofillHints,

    this.options,
    this.initialValue,
    this.boolController,

    this.builder,
  });

  String? validate(String? value) {
    for (final v in validators) {
      final result = v(value);
      if (result != null) return result;
    }
    return null;
  }

  String get value => controller.text;
}
