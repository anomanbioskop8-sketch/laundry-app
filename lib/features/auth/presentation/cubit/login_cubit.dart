// =============================================================================
// File        : auth_cubit.dart
// Path        : lib/features/auth/presentation/cubit/auth_cubit.dart
// Layer       : Presentation (Cubit)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengelola proses autentikasi pengguna
// - Menangani login dan registrasi pengguna
// - Mengatur state loading, success, dan error menggunakan `LoginState`
// - Menyimpan session user ke `SessionCubit` setelah autentikasi berhasil
// - Menjadi penghubung antara Presentation Layer dan Domain Layer
// =============================================================================

import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/features/auth/domain/usecases/params/login_params.dart';
import 'package:app_laundry/features/auth/domain/usecases/login.dart';
import 'package:app_laundry/features/auth/domain/usecases/params/register_params.dart';
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

  /// Proses login pengguna
  Future<void> login(LoginParams params) async {
    emit(const LoginState.loading());

    final result = await loginUseCase(params);

    result.fold((failure) => emit(LoginState.error(failure.message)), (user) {
      session.setSession(user);
      emit(const LoginState.success());
    });
  }

  /// Proses registrasi pengguna baru
  Future<void> register(RegisterParams params) async {
    emit(const LoginState.loading());

    final result = await registerUseCase(params);

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
