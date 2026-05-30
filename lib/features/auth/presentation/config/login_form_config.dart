import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/auth_strings.dart';
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
        controller: controller.email,
        label: AuthStrings.emailLabel,
        hintText: AuthStrings.emailHint,
        prefixIcon: AppIcons.email,
        keyboardType: TextInputType.emailAddress,
        autofillHints: [AutofillHints.email],
        validators: [AppValidator.email],
      ),

      /// 🔒 PASSWORD
      FormFieldConfig(
        name: 'password',
        controller: controller.pass,
        label: AuthStrings.passwordLabel,
        hintText: AuthStrings.passwordHint,
        prefixIcon: AppIcons.password,
        obscureText: true, // 🔥 penting
        autofillHints: [AutofillHints.password],
        validators: [AppValidator.password],
      ),
    ];
  }
}
