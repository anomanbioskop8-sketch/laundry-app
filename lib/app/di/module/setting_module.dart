// =============================================================================
// File        : auth_module.dart
// Path        : lib/app/di/module/auth_module.dart
// Layer       : App (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency untuk fitur Auth (DataSource → Repository → UseCase → Cubit)
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:app_laundry/features/setting/data/repositories/setting_repository_impl.dart';
import 'package:app_laundry/features/setting/domain/repositories/setting_repository.dart';
import 'package:app_laundry/features/setting/domain/usecases/get_setting.dart';
import 'package:app_laundry/features/setting/domain/usecases/stream_setting.dart';
import 'package:app_laundry/features/setting/domain/usecases/update_setting.dart';
import 'package:app_laundry/features/setting/presentation/cubit/setting_action_cubit.dart';
import 'package:app_laundry/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:get_it/get_it.dart';

class SettingModule {
  final GetIt sl;

  SettingModule(this.sl);

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
    sl.registerLazySingleton<SettingRemoteDataSource>(
      () => SettingRemoteDataSource(
        sl(),
        firestore: sl(), // logger
      ),
    );
  }

  // =========================
  // REPOSITORY
  // =========================
  void _repositories() {
    sl.registerLazySingleton<SettingRepository>(
      () => SettingRepositoryImpl(
        sl<SettingRemoteDataSource>(), // explicit biar jelas
      ),
    );
  }

  // =========================
  // USE CASE
  // =========================
  void _useCases() {
    sl.registerLazySingleton<GetSetting>(
      () => GetSetting(sl<SettingRepository>()),
    );

    sl.registerLazySingleton<StreamSetting>(
      () => StreamSetting(
        repository: sl<SettingRepository>(),
        session: sl<SessionService>(),
      ),
    );

    sl.registerLazySingleton<UpdateSetting>(
      () => UpdateSetting(sl<SettingRepository>()),
    );

    // sl.registerLazySingleton<GetCurrentUser>(
    //   () => GetCurrentUser(sl<AuthRepository>()),
    // );
  }

  // =========================
  // CUBIT (UI LAYER)
  // =========================
  void _cubits() {
    /// AuthCubit → handle bootstrap auth & session check
    sl.registerFactory<SettingCubit>(
      () => SettingCubit(streamSetting: sl<StreamSetting>()),
    );

    /// LoginCubit → hanya handle action login (tidak global state)
    sl.registerFactory<SettingActionCubit>(
      () => SettingActionCubit(update: sl(), session: sl()),
    );
  }
}
