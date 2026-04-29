import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(const SessionState.initial());

  /// =========================
  /// SET SESSION (LOGIN SUCCESS)
  /// =========================
  void setSession(UserEntity user) {
    emit(SessionState.active(user: user));
  }

  /// =========================
  /// CLEAR SESSION (LOGOUT)
  /// =========================
  void clearSession() {
    emit(const SessionState.inactive());
  }

  /// =========================
  /// INTERNAL HELPER
  /// =========================
  UserEntity get _user {
    return state.maybeWhen(
      active: (user) => user,
      orElse: () => throw const UnauthorizedException('Session belum aktif'),
    );
  }

  /// =========================
  /// GETTERS (SAFE ACCESS)
  /// =========================
  String get userId => _user.id;
  UserRole get role => _user.role;
  String get companyId => _user.companyId;
  UserEntity get user => _user;

  bool get isActive =>
      state.maybeWhen(active: (_) => true, orElse: () => false);
}
