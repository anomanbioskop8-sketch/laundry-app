import 'package:app_laundry/core/error/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'session_state.dart';
import '../../../features/auth/domain/entities/user_entity.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(const SessionState.initial());

  /// =========================
  /// SET SESSION (LOGIN SUCCESS)
  /// =========================
  void setSession(UserEntity user) {
    emit(SessionState.active(user: user, companyId: user.companyId));
  }

  /// =========================
  /// CLEAR SESSION (LOGOUT)
  /// =========================
  void clearSession() {
    emit(const SessionState.inactive());
  }

  /// =========================
  /// GETTERS (SAFE ACCESS)
  /// =========================
  String get companyId {
    return state.maybeWhen(
      active: (_, companyId) => companyId,
      orElse: () => throw const UnauthorizedException('Session belum aktif'),
    );
  }

  UserEntity get user {
    return state.maybeWhen(
      active: (user, _) => user,
      orElse: () => throw Exception('Session belum aktif'),
    );
  }

  bool get isActive {
    return state.maybeWhen(active: (_, _) => true, orElse: () => false);
  }
}
