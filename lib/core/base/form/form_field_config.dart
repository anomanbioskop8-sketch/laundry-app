import 'package:flutter/material.dart';

typedef Validator = String? Function(String? value);

class FormFieldConfig {
  final String name;
  final String label;
  final TextEditingController controller;
  final List<Validator> validators;
  final TextInputType keyboardType;
  final bool obscureText;
  final Iterable<String>? autofillHints;

  FormFieldConfig({
    required this.name,
    required this.label,
    required this.controller,
    this.validators = const [],
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.autofillHints,
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
