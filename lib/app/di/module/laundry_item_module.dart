// =============================================================================
// File        : customer_module.dart
// Path        : lib/app/di/module/customer_module.dart
// Layer       : App (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency untuk fitur Customer
// =============================================================================

import 'package:app_laundry/features/laundry_item/data/datasources/laundry_item_remote_datasource.dart';
import 'package:app_laundry/features/laundry_item/data/repositories/laundry_item_repository_impl.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/create_laundry_item.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/delete_customer.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/save_laundry_item.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/stream_laundry_items.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/update_laundry_item.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart';
import 'package:app_laundry/features/laundry_item/presentation/cubit/laundry_item_cubit.dart';
import 'package:get_it/get_it.dart';

class LaundryItemModule {
  final GetIt sl;

  LaundryItemModule(this.sl);

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
    sl.registerLazySingleton<LaundryItemRemoteDataSource>(
      () => LaundryItemRemoteDataSource(
        sl(), // logger
        firestore: sl(), // FirebaseFirestore
      ),
    );
  }

  // =========================
  // REPOSITORY
  // =========================
  void _repositories() {
    sl.registerLazySingleton<LaundryItemRepository>(
      () => LaundryItemRepositoryImpl(sl<LaundryItemRemoteDataSource>()),
    );
  }

  // =========================
  // USE CASE
  // =========================
  void _useCases() {
    sl.registerLazySingleton<StreamLaundryItems>(
      () => StreamLaundryItems(
        repository: sl<LaundryItemRepository>(),
        session: sl(), // SessionCubit
      ),
    );

    sl.registerLazySingleton<CreateLaundryItem>(
      () => CreateLaundryItem(
        repository: sl<LaundryItemRepository>(),
        session: sl(), // ⚠️ butuh session aktif
      ),
    );

    sl.registerLazySingleton<UpdateLaundryItem>(
      () => UpdateLaundryItem(
        repository: sl<LaundryItemRepository>(),
        session: sl(),
      ),
    );

    /// 🔥 SaveCustomer = wrapper create/update
    sl.registerLazySingleton<SaveLaundryItem>(
      () => SaveLaundryItem(
        createLaundryItem: sl<CreateLaundryItem>(),
        updateLaundryItem: sl<UpdateLaundryItem>(),
      ),
    );

    sl.registerLazySingleton<DeleteLaundryItem>(
      () => DeleteLaundryItem(
        repository: sl<LaundryItemRepository>(),
        session: sl(), // ⚠️ guard akses
      ),
    );
  }

  // =========================
  // CUBIT (UI LAYER)
  // =========================
  void _cubits() {
    /// CustomerCubit → stream data (list)
    sl.registerFactory<LaundryItemCubit>(
      () => LaundryItemCubit(sl<StreamLaundryItems>()),
    );

    /// CustomerActionCubit → create / update / delete
    sl.registerFactory<LaundryItemActionCubit>(
      () => LaundryItemActionCubit(
        save: sl<SaveLaundryItem>(),
        delete: sl<DeleteLaundryItem>(),
      ),
    );
  }
}
