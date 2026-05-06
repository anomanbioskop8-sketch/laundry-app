import 'package:flutter/material.dart';

abstract class FormController {
  final formKey = GlobalKey<FormState>();

  /// Override ini
  List<TextEditingController> get controllers;

  /// VALIDATE
  bool validate() {
    return formKey.currentState?.validate() ?? false;
  }

  /// DISPOSE
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
  }
}
