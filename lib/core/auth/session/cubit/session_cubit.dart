// =============================================================================
// File        : session_cubit.dart
// Path        : lib/core/auth/session/cubit/session_cubit.dart
// Layer       : Core (Session Management)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyimpan state session user (active / inactive / loading)
// - Handle auto-login (getCurrentUser)
// =============================================================================

import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/cubit/session_state.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  final GetCurrentUser getCurrentUser;

  bool _initialized = false;

  SessionCubit(this.getCurrentUser) : super(const SessionState.initial());

  /// =========================
  /// INIT (AUTO LOGIN)
  /// =========================
  Future<void> init() async {
    /// 🔥 Hindari double init
    if (_initialized) return;
    _initialized = true;

    emit(const SessionState.loading());

    /// 🔥 Delay untuk UX (splash terlihat)
    const delay = Duration(milliseconds: 600);

    final result = await Future.wait([getCurrentUser(), Future.delayed(delay)]);

    final userResult = result[0];

    userResult.fold((_) => emit(const SessionState.inactive()), (user) {
      if (user == null) {
        emit(const SessionState.inactive());
      } else {
        emit(SessionState.active(user));
      }
    });
  }

  /// =========================
  /// SET SESSION (LOGIN)
  /// =========================
  void setSession(UserEntity user) {
    emit(SessionState.active(user));
  }

  /// =========================
  /// CLEAR SESSION (LOGOUT)
  /// =========================
  void clearSession() {
    emit(const SessionState.inactive());
  }

  /// =========================
  /// INTERNAL SAFE ACCESS
  /// =========================
  UserEntity get _user {
    return state.maybeWhen(
      active: (user) => user,
      orElse: () => throw const UnauthorizedException('Session belum aktif'),
    );
  }

  /// =========================
  /// PUBLIC GETTERS
  /// =========================
  String get userId => _user.id;

  String get companyId => _user.companyId;

  UserRole get role => _user.role;

  UserEntity get user => _user;

  bool get isLoading =>
      state.maybeWhen(loading: () => true, orElse: () => false);

  bool get isActive =>
      state.maybeWhen(active: (_) => true, orElse: () => false);
}
