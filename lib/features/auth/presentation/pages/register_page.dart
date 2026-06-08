import 'package:app_laundry/app/router/extensions/go/auth_navigation_ext.dart';
import 'package:app_laundry/core/form/builders/form_builder.dart';
import 'package:app_laundry/core/constants/strings/auth_strings.dart';
import 'package:app_laundry/features/auth/presentation/config/register_form_config.dart';
import 'package:app_laundry/features/auth/presentation/controllers/register_form_controller.dart';
import 'package:app_laundry/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // =========================
  // CONTROLLER
  // =========================

  late final RegisterFormController _controller;
  late final RegisterFormConfig _config;

  // =========================
  // INIT
  // =========================

  @override
  void initState() {
    super.initState();
    _controller = RegisterFormController();
    _config = RegisterFormConfig(_controller);
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
    await context.read<LoginCubit>().register(_controller.buildParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AuthStrings.registerTitle)),

      body: Column(
        children: [
          FormBuilder(
            formKey: _controller.formKey,
            fields: _config.fields,
            onSubmit: _submit,
            submitLabel: AuthStrings.registerTitle,
          ),

          TextButton(
            onPressed: () => context.goLogin(),
            child: const Text(AuthStrings.loginHint),
          ),
        ],
      ),
    );
  }
}
