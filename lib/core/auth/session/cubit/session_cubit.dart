import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/cubit/session_state.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  final GetCurrentUser getCurrentUser;
  SessionCubit(this.getCurrentUser) : super(const SessionState.initial());

  Future<void> init() async {
    emit(const SessionState.loading());

    final result = await Future.wait([
      getCurrentUser(),
      Future.delayed(const Duration(milliseconds: 600)),
    ]);

    final userResult = result[0];

    userResult.fold((_) => emit(const SessionState.inactive()), (user) {
      if (user != null) {
        emit(SessionState.active(user));
      } else {
        emit(const SessionState.inactive());
      }
    });
  }

  /// =========================
  /// SET SESSION
  /// =========================
  void setSession(UserEntity user) {
    emit(SessionState.active(user));
  }

  /// =========================
  /// CLEAR SESSION
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
  /// PUBLIC GETTERS (SYNC)
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
