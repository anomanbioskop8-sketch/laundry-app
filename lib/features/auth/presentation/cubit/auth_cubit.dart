import 'package:app_laundry/core/session/cubit/session_cubit.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:app_laundry/features/auth/domain/usecases/login.dart';
import 'package:app_laundry/features/auth/domain/usecases/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Login loginUseCase;
  final Register registerUseCase;
  final GetCurrentUser getCurrentUserUseCase;
  final SessionCubit sessionCubit;

  bool _initialized = false;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.getCurrentUserUseCase,
    required this.sessionCubit,
  }) : super(const AuthState.initial());

  /// CHECK LOGIN (AUTO LOGIN)
  Future<void> checkAuth() async {
    if (_initialized) return; // 🔥 anti double call
    _initialized = true;
    emit(const AuthState.loading());

    final result = await getCurrentUserUseCase();
    result.fold(
      (failure) {
        emit(AuthState.error(failure.message));
      },
      (user) {
        if (user != null) {
          sessionCubit.setSession(user);
          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.unauthenticated());
        }
      },
    );
  }

  /// LOGIN
  Future<void> login(String email, String password) async {
    emit(const AuthState.loading());

    final result = await loginUseCase(email, password);
    result.fold(
      (failure) {
        emit(AuthState.error(failure.message));
      },
      (user) {
        sessionCubit.setSession(user);
        emit(AuthState.authenticated(user));
      },
    );
  }

  /// REGISTER
  Future<void> register(String name, String email, String password) async {
    emit(const AuthState.loading());

    final result = await registerUseCase(name, email, password);
    result.fold(
      (failure) {
        emit(AuthState.error(failure.message));
      },
      (user) {
        sessionCubit.setSession(user);
        emit(AuthState.authenticated(user));
      },
    );
  }

  Future<void> logout() async {
    //await repository.logout();
    sessionCubit.clearSession();
    emit(const AuthState.unauthenticated());
  }
}

/// LOGOUT
