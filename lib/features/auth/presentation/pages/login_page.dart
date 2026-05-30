import 'package:app_laundry/app/router/extensions/go/auth_navigation_ext.dart';
import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/constants/strings/auth_strings.dart';
import 'package:app_laundry/features/auth/presentation/config/login_form_config.dart';
import 'package:app_laundry/features/auth/presentation/controllers/login_form_controller.dart';
import 'package:app_laundry/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // =========================
  // CONTROLLER
  // =========================

  late final LoginFormController _controller;
  late final LoginFormConfig _config;

  // =========================
  // INIT
  // =========================

  @override
  void initState() {
    super.initState();
    _controller = LoginFormController();
    _config = LoginFormConfig(_controller);
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // =========================
  // SUBMIT
  // =========================

  Future<void> _submit() async {
    await context.read<LoginCubit>().login(_controller.buildParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AuthStrings.loginTitle)),
      body: Column(
        children: [
          FormBuilder(
            formKey: _controller.formKey,
            fields: _config.fields,
            onSubmit: _submit,
            submitLabel: AuthStrings.loginTitle,
          ),

          TextButton(
            onPressed: () => context.goRegister(),
            child: const Text(AuthStrings.registerHint),
          ),
        ],
      ),
    );
  }
}
