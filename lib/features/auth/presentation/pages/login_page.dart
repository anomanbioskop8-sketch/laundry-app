import 'package:app_laundry/app/router/extensions/go/auth_navigation_ext.dart';
import 'package:app_laundry/core/constants/strings/auth_strings.dart';
import 'package:app_laundry/core/form/builders/form_builder.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
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
  late final LoginFormController _controller;
  late final LoginFormConfig _config;

  @override
  void initState() {
    super.initState();
    _controller = LoginFormController();
    _config = LoginFormConfig(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    await context.read<LoginCubit>().login(_controller.buildParams());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AuthStrings.loginTitle)),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.spacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang',
                    style: context.text.headlineSmall?.semiBold,
                  ),

                  context.spacing.sm.h,

                  Text(
                    'Masuk untuk melanjutkan ke aplikasi.',
                    style: context.text.bodyMedium,
                  ),
                ],
              ),
            ),

            Expanded(
              child: FormBuilder(
                formKey: _controller.formKey,
                fields: _config.fields,
                onSubmit: _submit,
                submitLabel: AuthStrings.loginTitle,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: context.spacing.lg),
              child: TextButton(
                onPressed: context.goRegister,
                child: const Text(AuthStrings.registerHint),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
