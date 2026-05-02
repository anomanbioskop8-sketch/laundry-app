import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/constants/auth_strings.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
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
  final controller = LoginFormController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final config = LoginFormConfig(controller);

    return Scaffold(
      appBar: AppBar(title: const Text(AuthStrings.loginTitle)),

      body: Padding(
        padding: EdgeInsets.all(context.spacing.lg),
        child: Column(
          children: [
            FormBuilder(
              formKey: controller.formKey,
              fields: config.fields,
              onSubmit: () {
                cubit.login(controller.buildParams());
              },
            ),

            context.spacing.md.h,

            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Belum punya akun? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
