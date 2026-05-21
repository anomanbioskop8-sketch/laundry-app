// =============================================================================
// File        : auth_module.dart
// Path        : lib/app/di/module/auth_module.dart
// Layer       : App (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency untuk fitur Auth (DataSource → Repository → UseCase → Cubit)
// =============================================================================

import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/utils/logger_service.dart';
import 'package:app_laundry/features/company/data/datasources/company_remote_data_source.dart';
import 'package:app_laundry/features/company/data/repositories/company_repository_impl.dart';
import 'package:app_laundry/features/company/domain/repositories/company_repository.dart';
import 'package:app_laundry/features/company/domain/usecases/get_company_by_id.dart';
import 'package:app_laundry/features/company/domain/usecases/update_company.dart';
import 'package:app_laundry/features/company/presentation/cubit/company_action_cubit.dart';
import 'package:app_laundry/features/company/presentation/cubit/company_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

class CompanyModule {
  final GetIt sl;

  CompanyModule(this.sl);

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
    sl.registerLazySingleton<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSource(
        sl<LoggerService>(),
        firestore: sl<FirebaseFirestore>(), // logger
      ),
    );
  }

  // =========================
  // REPOSITORY
  // =========================
  void _repositories() {
    sl.registerLazySingleton<CompanyRepository>(
      () => CompanyRepositoryImpl(
        sl<CompanyRemoteDataSource>(), // explicit biar jelas
      ),
    );
  }

  // =========================
  // USE CASE
  // =========================
  void _useCases() {
    sl.registerLazySingleton<GetCompanyById>(
      () => GetCompanyById(sl<CompanyRepository>()),
    );

    sl.registerLazySingleton<UpdateCompany>(
      () => UpdateCompany(sl<CompanyRepository>()),
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
    sl.registerFactory<CompanyCubit>(() => CompanyCubit(sl<SessionCubit>()));

    /// LoginCubit → hanya handle action login (tidak global state)
    sl.registerFactory<CompanyActionCubit>(
      () => CompanyActionCubit(update: sl(), sessionCubit: sl()),
    );
  }
}
