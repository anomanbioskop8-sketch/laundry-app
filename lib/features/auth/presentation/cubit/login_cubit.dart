import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/features/auth/domain/usecases/auth_params.dart';
import 'package:app_laundry/features/auth/domain/usecases/login.dart';
import 'package:app_laundry/features/auth/domain/usecases/register.dart';
import 'package:app_laundry/features/auth/presentation/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final Login loginUseCase;
  final Register registerUseCase;
  final SessionCubit session;

  LoginCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.session,
  }) : super(const LoginState.initial());

  Future<void> login(LoginParams params) async {
    emit(const LoginState.loading());

    final result = await loginUseCase(params);

    result.fold((failure) => emit(LoginState.error(failure.message)), (user) {
      session.setSession(user); // 🔥 update global
      emit(const LoginState.success());
    });
  }

  /// REGISTER
  Future<void> register(String name, String email, String password) async {
    emit(const LoginState.loading());

    final result = await registerUseCase(name, email, password);
    result.fold(
      (failure) {
        emit(LoginState.error(failure.message));
      },
      (user) {
        session.setSession(user);
        emit(LoginState.success());
      },
    );
  }
}
