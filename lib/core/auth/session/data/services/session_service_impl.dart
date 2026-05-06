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
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

class SessionServiceImpl implements SessionService {
  final SessionCubit cubit;

  SessionServiceImpl(this.cubit);

  /// =========================
  /// INTERNAL SAFE ACCESS
  /// =========================
  UserEntity get _user {
    return cubit.state.maybeWhen(
      active: (user) => user,
      orElse: () => throw const UnauthorizedException('Session belum aktif'),
    );
  }

  /// =========================
  /// STATUS
  /// =========================
  @override
  bool get isActive => cubit.isActive;

  /// =========================
  /// DATA ACCESS
  /// =========================
  @override
  String get userId => _user.id;

  @override
  String get companyId => _user.companyId;

  @override
  UserRole get role => _user.role;

  /// =========================
  /// OPTIONAL SAFE ACCESS
  /// =========================
  @override
  UserEntity? get userOrNull {
    return cubit.state.maybeWhen(active: (user) => user, orElse: () => null);
  }
}
