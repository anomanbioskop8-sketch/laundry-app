import 'package:app_laundry/core/base/form/controllers/form_controller.dart';
import 'package:app_laundry/features/auth/domain/usecases/params/register_params.dart';
import 'package:flutter/material.dart';

class RegisterFormController extends FormController {
  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  List<TextEditingController> get controllers => [email, pass, confirmPassword];

  // =========================
  // BUILD PARAMS
  // =========================
  RegisterParams buildParams() {
    return RegisterParams(
      name: name.text.trim(),
      email: email.text.trim(),
      password: pass.text.trim(),
      confirmPassword: confirmPassword.text.trim(),
    );
  }
}
