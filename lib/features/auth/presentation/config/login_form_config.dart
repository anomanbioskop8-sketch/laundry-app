import 'package:flutter/material.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';
import 'package:app_laundry/features/auth/presentation/controllers/login_form_controller.dart';

class LoginFormConfig {
  final LoginFormController controller;

  LoginFormConfig(this.controller);

  /// =========================
  /// BUILD FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      /// 📧 EMAIL
      FormFieldConfig(
        name: 'email',
        label: 'Email',
        controller: controller.email,
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
        validators: [
          (v) => AppValidator.required(v, field: 'Email'),
          AppValidator.email,
        ],
      ),

      /// 🔒 PASSWORD
      FormFieldConfig(
        name: 'password',
        label: 'Password',
        controller: controller.pass,
        obscureText: true, // 🔥 penting
        autofillHints: [AutofillHints.password],
        validators: [
          (v) => AppValidator.required(v, field: 'Password'),
          AppValidator.password,
        ],
      ),
    ];
  }
}
