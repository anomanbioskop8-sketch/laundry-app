import '../../cubit/session_cubit.dart';
import '../../domain/services/session_service.dart';

class SessionServiceImpl implements SessionService {
  final SessionCubit cubit;

  SessionServiceImpl(this.cubit);

  @override
  String get userId => cubit.userId;

  @override
  String get companyId => cubit.companyId;

  @override
  String get role => cubit.role;
}
