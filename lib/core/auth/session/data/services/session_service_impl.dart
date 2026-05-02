import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/auth/session/cubit/session_state.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

class SessionServiceImpl implements SessionService {
  final SessionCubit cubit;

  SessionServiceImpl(this.cubit);

  UserEntity get _user {
    return cubit.state.maybeWhen(
      active: (user) => user,
      orElse: () => throw const UnauthorizedException('Session belum aktif'),
    );
  }

  @override
  String get companyId => _user.companyId;

  @override
  String get userId => _user.id;

  @override
  UserRole get role => _user.role;
}
