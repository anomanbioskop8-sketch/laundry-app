import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/auth/session/data/services/session_service_impl.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:app_laundry/features/company/domain/usecases/get_company_by_id.dart';
import 'package:get_it/get_it.dart';

void registerSession(GetIt sl) {
  sl.registerLazySingleton<SessionCubit>(
    () => SessionCubit(sl<GetCurrentUser>(), sl<GetCompanyById>()),
  );

  sl.registerLazySingleton<SessionService>(
    () => SessionServiceImpl(sl<SessionCubit>()),
  );
}
