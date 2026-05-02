import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/auth/session/cubit/session_state.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetCurrentUser getCurrentUserUseCase;
  final SessionCubit sessionCubit;

  bool _initialized = false;

  AuthCubit({required this.getCurrentUserUseCase, required this.sessionCubit})
    : super(const AuthState.initial());

  /// CHECK LOGIN (AUTO LOGIN)
  Future<void> checkAuth() async {
    if (_initialized) return; // 🔥 anti double call
    _initialized = true;
    emit(const AuthState.loading());
    sessionCubit.emit(const SessionState.loading());

    final result = await getCurrentUserUseCase();
    result.fold(
      (failure) {
        emit(AuthState.error(failure.message));
        sessionCubit.emit(const SessionState.inactive());
      },
      (user) async {
        if (user != null) {
          sessionCubit.setSession(user);
          emit(AuthState.authenticated(user));
        } else {
          emit(const AuthState.unauthenticated());
          sessionCubit.emit(const SessionState.inactive());
        }
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
