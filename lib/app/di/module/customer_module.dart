// =============================================================================
// File        : customer_module.dart
// Path        : lib/app/di/module/customer_module.dart
// Layer       : App (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency untuk fitur Customer
// =============================================================================

import 'package:app_laundry/features/customer/data/datasources/customer_remote_data_source.dart';
import 'package:app_laundry/features/customer/data/repositories/customer_repository_impl.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/create_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/delete_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/get_customers_by_ids.dart';
import 'package:app_laundry/features/customer/domain/usecase/save_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/stream_customers.dart';
import 'package:app_laundry/features/customer/domain/usecase/update_customer.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:get_it/get_it.dart';

class CustomerModule {
  final GetIt sl;

  CustomerModule(this.sl);

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
    sl.registerLazySingleton<CustomerRemoteDataSource>(
      () => CustomerRemoteDataSource(
        sl(), // logger
        firestore: sl(), // FirebaseFirestore
      ),
    );
  }

  // =========================
  // REPOSITORY
  // =========================
  void _repositories() {
    sl.registerLazySingleton<CustomerRepository>(
      () => CustomerRepositoryImpl(sl<CustomerRemoteDataSource>()),
    );
  }

  // =========================
  // USE CASE
  // =========================
  void _useCases() {
    sl.registerLazySingleton<StreamCustomers>(
      () => StreamCustomers(
        repository: sl<CustomerRepository>(),
        session: sl(), // SessionCubit
      ),
    );

    sl.registerLazySingleton<GetCustomersByIds>(
      () => GetCustomersByIds(
        repository: sl<CustomerRepository>(),
        session: sl(), // SessionCubit
      ),
    );

    sl.registerLazySingleton<CreateCustomer>(
      () => CreateCustomer(
        repository: sl<CustomerRepository>(),
        session: sl(), // ⚠️ butuh session aktif
      ),
    );

    sl.registerLazySingleton<UpdateCustomer>(
      () => UpdateCustomer(repository: sl<CustomerRepository>(), session: sl()),
    );

    /// 🔥 SaveCustomer = wrapper create/update
    sl.registerLazySingleton<SaveCustomer>(
      () => SaveCustomer(
        createCustomer: sl<CreateCustomer>(),
        updateCustomer: sl<UpdateCustomer>(),
      ),
    );

    sl.registerLazySingleton<DeleteCustomer>(
      () => DeleteCustomer(
        repository: sl<CustomerRepository>(),
        session: sl(), // ⚠️ guard akses
      ),
    );
  }

  // =========================
  // CUBIT (UI LAYER)
  // =========================
  void _cubits() {
    /// CustomerCubit → stream data (list)
    sl.registerFactory<CustomerCubit>(
      () => CustomerCubit(sl<StreamCustomers>()),
    );

    /// CustomerActionCubit → create / update / delete
    sl.registerFactory<CustomerActionCubit>(
      () => CustomerActionCubit(
        save: sl<SaveCustomer>(),
        delete: sl<DeleteCustomer>(),
      ),
    );
  }
}
