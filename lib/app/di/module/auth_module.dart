import 'package:app_laundry/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app_laundry/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:app_laundry/features/auth/domain/usecases/login.dart';
import 'package:app_laundry/features/auth/domain/usecases/register.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

class AuthModule {
  final GetIt sl;

  AuthModule(this.sl);

  Future<void> init() async {
    /// DataSource
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(sl(), sl(), sl()),
    );

    /// Repository
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

    /// UseCase
    sl.registerLazySingleton(() => Login(sl()));
    sl.registerLazySingleton(() => Register(sl()));
    sl.registerLazySingleton(() => GetCurrentUser(sl()));

    sl.registerFactory(
      () => AuthCubit(
        loginUseCase: sl(),
        registerUseCase: sl(),
        getCurrentUserUseCase: sl(),
        sessionCubit: sl(),
      ),
    );
  }
}
