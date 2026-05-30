import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/core/constants/strings/auth_strings.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/features/auth/presentation/cubit/login_cubit.dart';
import 'package:app_laundry/features/auth/presentation/cubit/login_state.dart';
import 'package:app_laundry/features/auth/presentation/pages/register_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageWrapper extends StatelessWidget {
  const RegisterPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<LoginCubit>())],
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () => AppUIService.success(AuthStrings.registerSuccess),
            error: (msg) => AppUIService.error(msg),
          );
        },
        child: RegisterPage(),
      ),
    );
  }
}
