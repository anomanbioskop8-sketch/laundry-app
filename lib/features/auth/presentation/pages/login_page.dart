import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/services/snackbar_service.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:app_laundry/features/auth/presentation/config/login_form_config.dart';
import 'package:app_laundry/features/auth/presentation/controllers/login_form_controller.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_state.dart';
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
    final cubit = context.read<AuthCubit>();
    final config = LoginFormConfig(controller);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),

      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: (user) {
              AppSnackbar1.success(context, 'Login berhasil');
            },
            error: (message) {
              AppSnackbar1.success(context, message);
            },
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              FormBuilder(
                formKey: controller.formKey,
                fields: config.fields,
                onSubmit: () {
                  cubit.login(controller.buildParams());
                },
              ),

              SizedBox(height: AppSpacing.md),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: const Text('Belum punya akun? Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
