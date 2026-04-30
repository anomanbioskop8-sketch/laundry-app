import 'package:app_laundry/core/base/form/form_controller.dart';
import 'package:app_laundry/features/auth/domain/usecases/auth_params.dart';
import 'package:flutter/material.dart';

class LoginFormController extends FormController {
  final email = TextEditingController();
  final pass = TextEditingController();

  @override
  List<TextEditingController> get controllers => [email, pass];

  /// =========================
  /// BUILD PARAMS
  /// =========================
  LoginParams buildParams() {
    return LoginParams(email: email.text.trim(), pass: pass.text.trim());
  }
}
