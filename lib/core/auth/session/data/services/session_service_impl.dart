// =============================================================================
// File        : session_service_impl.dart
// Path        : lib/core/auth/session/data/services/session_service_impl.dart
// Layer       : Core (Session Service)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan akses session secara synchronous untuk domain & core layer
// - Wrapper di atas SessionCubit (decoupling dari presentation layer)
// =============================================================================

import 'package:app_laundry/core/auth/role/user_role.dart';

import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/auth/session/cubit/session_state.dart';

import 'package:app_laundry/core/auth/session/domain/entities/session_auth_entity.dart';

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';

import 'package:app_laundry/core/error/exceptions.dart';

import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

class SessionServiceImpl implements SessionService {
  final SessionCubit cubit;

  SessionServiceImpl(this.cubit);

  /// =========================
  /// INTERNAL SAFE ACCESS
  /// =========================

  SessionAuthEntity get _session {
    return cubit.state.maybeWhen(
      active: (session) => session,
      orElse: () => throw const UnauthorizedException('Session belum aktif'),
    );
  }

  // =========================
  // STATUS
  // =========================

  @override
  bool get isActive => cubit.isActive;

  // =========================
  // SESSION
  // =========================

  @override
  SessionAuthEntity? get sessionOrNull {
    return cubit.state.maybeWhen(
      active: (session) => session,
      orElse: () => null,
    );
  }

  // =========================
  // USER
  // =========================

  @override
  String get userId => _session.user.id;

  @override
  UserEntity? get userOrNull => sessionOrNull?.user;

  // =========================
  // COMPANY
  // =========================

  @override
  String get companyId => _session.user.companyId;

  @override
  CompanyEntity? get companyOrNull => sessionOrNull?.company;

  // =========================
  // ROLE
  // =========================

  @override
  UserRole get role => _session.user.role;
}
