import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/auth_strings.dart';
import 'package:app_laundry/features/auth/presentation/controllers/register_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_laundry/core/base/form/form_field_config.dart';
import 'package:app_laundry/core/base/validators/app_validator.dart';

class RegisterFormConfig {
  final RegisterFormController controller;

  RegisterFormConfig(this.controller);

  /// =========================
  /// BUILD FIELDS
  /// =========================
  List<FormFieldConfig> get fields {
    return [
      FormFieldConfig(
        name: 'name',
        controller: controller.name,
        label: AuthStrings.nameLabel,
        hintText: AuthStrings.nameHint,
        prefixIcon: AppIcons.user,
        validators: [
          (v) => AppValidator.required(v, message: AuthStrings.nameRequired),
        ],
      ),

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
        label: 'Password',
        hintText: AuthStrings.passwordHint,
        prefixIcon: AppIcons.password,
        obscureText: true, // 🔥 penting
        autofillHints: [AutofillHints.password],
        validators: [AppValidator.password, AppValidator.strongPassword],
      ),

      FormFieldConfig(
        name: 'confirmPassword',
        controller: controller.confirmPassword,
        label: AuthStrings.confirmPasswordLabel,
        hintText: AuthStrings.confirmPasswordHint,
        prefixIcon: AppIcons.password,
        obscureText: true, // 🔥 penting
        autofillHints: [AutofillHints.password],
        validators: [
          (v) => AppValidator.confirmPassword(v, controller.pass.text),
        ],
      ),
    ];
  }
}
