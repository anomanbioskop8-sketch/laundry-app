// =============================================================================
// File        : session_cubit.dart
// Path        : lib/core/auth/session/cubit/session_cubit.dart
// Layer       : Core (Session Management)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyimpan authenticated session
// - Handle auto-login (getCurrentUser)
// - Menyimpan user + company aktif
// =============================================================================

import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/cubit/session_state.dart';
import 'package:app_laundry/core/auth/session/domain/entities/session_auth_entity.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';
import 'package:app_laundry/features/company/domain/usecases/get_company_by_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionCubit extends Cubit<SessionState> {
  final GetCurrentUser getCurrentUser;
  final GetCompanyById getCompanyById;

  bool _initialized = false;

  SessionCubit(this.getCurrentUser, this.getCompanyById)
    : super(const SessionState.initial());

  // =========================
  // INIT (AUTO LOGIN)
  // =========================

  Future<void> init() async {
    if (_initialized) return;

    _initialized = true;

    emit(const SessionState.loading());

    const delay = Duration(milliseconds: 600);

    final result = await Future.wait([getCurrentUser(), Future.delayed(delay)]);

    final userResult = result[0];

    await userResult.fold((_) async => emit(const SessionState.inactive()), (
      user,
    ) async {
      if (user == null) {
        emit(const SessionState.inactive());
        return;
      }

      await setSession(user);
    });
  }

  // =========================
  // SET SESSION
  // =========================

  Future<void> setSession(UserEntity user) async {
    emit(SessionState.active(SessionAuthEntity(user: user, company: null)));

    await refreshCompany();
  }

  // =========================
  // REFRESH COMPANY
  // =========================

  Future<void> refreshCompany() async {
    final result = await getCompanyById(companyId);

    result.fold((_) {}, (company) {
      if (company == null) return;
      updateCompany(company);
    });
  }

  // =========================
  // UPDATE COMPANY
  // =========================

  void updateCompany(CompanyEntity company) {
    emit(SessionState.active(session.copyWith(company: company)));
  }

  // =========================
  // CLEAR SESSION
  // =========================

  void clearSession() {
    emit(const SessionState.inactive());
  }

  // =========================
  // INTERNAL SAFE ACCESS
  // =========================

  SessionAuthEntity get session {
    return state.maybeWhen(
      active: (session) => session,
      orElse: () => throw const UnauthorizedException('Session belum aktif'),
    );
  }

  // =========================
  // USER
  // =========================

  UserEntity get user => session.user;
  String get userId => user.id;

  // =========================
  // COMPANY
  // =========================

  CompanyEntity? get company => session.company;
  String get companyId => user.companyId;

  // =========================
  // ROLE
  // =========================

  UserRole get role => user.role;

  // =========================
  // STATUS
  // =========================

  bool get isLoading {
    return state.maybeWhen(loading: () => true, orElse: () => false);
  }

  bool get isActive {
    return state.maybeWhen(active: (_) => true, orElse: () => false);
  }
}
