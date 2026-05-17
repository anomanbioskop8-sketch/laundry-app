import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/core/base/form/form_builder.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/auth/presentation/config/login_form_config.dart';
import 'package:app_laundry/features/auth/presentation/controllers/login_form_controller.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_state.dart';
import 'package:app_laundry/features/auth/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      appBar: AppBar(title: const Text('Login')),

      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: (user) {
              AppUIService.success('Login berhasil');
            },
            error: (message) {
              AppUIService.error(message);
            },
          );
        },

        child: Padding(
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
                  context.pushNamed(AuthPaths.loginName);
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
