// =============================================================================
// File        : customer_module.dart
// Path        : lib/app/di/module/customer_module.dart
// Layer       : App (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency untuk fitur Customer
// =============================================================================

import 'package:app_laundry/features/laundry_price/data/datasources/laundry_price_remote_datasource.dart';
import 'package:app_laundry/features/laundry_price/data/repositories/laundry_price_repository_impl.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/create_default_price_item.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/delete_laundry_price.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/delete_laundry_price_by_item_id.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/stream_laundry_prices.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/update_laundry_price.dart';
import 'package:app_laundry/features/laundry_price/presentation/cubit/laundry_price_action_cubit.dart';
import 'package:app_laundry/features/laundry_price/presentation/cubit/laundry_price_cubit.dart';
import 'package:get_it/get_it.dart';

class LaundryPriceModule {
  final GetIt sl;

  LaundryPriceModule(this.sl);

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
    sl.registerLazySingleton<LaundryPriceRemoteDataSource>(
      () => LaundryPriceRemoteDataSource(
        sl(), // logger
        firestore: sl(), // FirebaseFirestore
      ),
    );
  }

  // =========================
  // REPOSITORY
  // =========================
  void _repositories() {
    sl.registerLazySingleton<LaundryPriceRepository>(
      () => LaundryPriceRepositoryImpl(sl<LaundryPriceRemoteDataSource>()),
    );
  }

  // =========================
  // USE CASE
  // =========================
  void _useCases() {
    // sl.registerLazySingleton<StreamLaundryItems>(
    //   () => StreamLaundryItems(
    //     repository: sl<LaundryItemRepository>(),
    //     session: sl(), // SessionCubit
    //   ),
    // );

    sl.registerLazySingleton<StreamLaundryPrices>(
      () => StreamLaundryPrices(
        repository: sl<LaundryPriceRepository>(),
        session: sl(), // ⚠️ butuh session aktif
      ),
    );

    sl.registerLazySingleton<CreateDefaultLaundryPrices>(
      () => CreateDefaultLaundryPrices(
        repository: sl<LaundryPriceRepository>(),
        session: sl(), // ⚠️ butuh session aktif
      ),
    );

    sl.registerLazySingleton<UpdateLaundryPrice>(
      () => UpdateLaundryPrice(
        repository: sl<LaundryPriceRepository>(),
        session: sl(),
      ),
    );

    /// 🔥 SaveCustomer = wrapper create/update
    // sl.registerLazySingleton<SaveLaundryItem>(
    //   () => SaveLaundryItem(
    //     createLaundryItem: sl<CreateLaundryItem>(),
    //     updateLaundryItem: sl<UpdateLaundryItem>(),
    //   ),
    // );

    sl.registerLazySingleton<DeleteLaundryPrice>(
      () => DeleteLaundryPrice(
        repository: sl<LaundryPriceRepository>(),
        session: sl(), // ⚠️ guard akses
      ),
    );
    sl.registerLazySingleton<DeleteLaundryPriceByItemId>(
      () => DeleteLaundryPriceByItemId(
        repository: sl<LaundryPriceRepository>(),
        session: sl(), // ⚠️ guard akses
      ),
    );
  }

  // =========================
  // CUBIT (UI LAYER)
  // =========================
  void _cubits() {
    /// CustomerCubit → stream data (list)
    sl.registerFactory<LaundryPriceCubit>(
      () => LaundryPriceCubit(sl<StreamLaundryPrices>()),
    );

    /// CustomerActionCubit → create / update / delete
    sl.registerFactory<LaundryPriceActionCubit>(
      () => LaundryPriceActionCubit(
        update: sl<UpdateLaundryPrice>(),
        delete: sl<DeleteLaundryPrice>(),
      ),
    );
  }
}
