// =============================================================================
// File        : auth_module.dart
// Path        : lib/app/di/module/auth_module.dart
// Layer       : App (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency untuk fitur Auth (DataSource → Repository → UseCase → Cubit)
// =============================================================================

import 'package:app_laundry/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app_laundry/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:app_laundry/features/auth/domain/usecases/login.dart';
import 'package:app_laundry/features/auth/domain/usecases/register.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:app_laundry/features/auth/presentation/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

class AuthModule {
  final GetIt sl;

  AuthModule(this.sl);

  Future<void> init() async {
    _dataSources();
    _repositories();
    _useCases();
    _cubits();
  }

  // =========================
  // DATA SOURCE
  // =========================
  void _dataSources() {
    sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(
        sl(), // logger
        sl(), // FirebaseAuth
        sl(), // FirebaseFirestore
      ),
    );
  }

  // =========================
  // REPOSITORY
  // =========================
  void _repositories() {
    sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        sl<AuthRemoteDataSource>(), // explicit biar jelas
      ),
    );
  }

  // =========================
  // USE CASE
  // =========================
  void _useCases() {
    sl.registerLazySingleton<Login>(() => Login(sl<AuthRepository>()));

    sl.registerLazySingleton<Register>(() => Register(sl<AuthRepository>()));

    sl.registerLazySingleton<GetCurrentUser>(
      () => GetCurrentUser(sl<AuthRepository>()),
    );
  }

  // =========================
  // CUBIT (UI LAYER)
  // =========================
  void _cubits() {
    /// AuthCubit → handle bootstrap auth & session check
    sl.registerFactory<AuthCubit>(
      () => AuthCubit(
        getCurrentUserUseCase: sl(),
        sessionCubit: sl(), // ⚠️ pastikan sudah di-register di core
      ),
    );

    /// LoginCubit → hanya handle action login (tidak global state)
    sl.registerFactory<LoginCubit>(
      () => LoginCubit(
        loginUseCase: sl(),
        registerUseCase: sl(),
        session: sl(), // update session saat login sukses
      ),
    );
  }
}
