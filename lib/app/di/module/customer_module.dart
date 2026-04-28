import 'package:app_laundry/features/customer/data/datasources/customer_remote_data_source.dart';
import 'package:app_laundry/features/customer/data/repositories/customer_repository_impl.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/create_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/delete_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/stream_customers.dart';
import 'package:app_laundry/features/customer/domain/usecase/update_customer.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customer/presentation/cubit/customer_cubit.dart';
import 'package:get_it/get_it.dart';

class CustomerModule {
  final GetIt sl;

  CustomerModule(this.sl);

  Future<void> init() async {
    /// DataSource
    sl.registerLazySingleton<CustomerRemoteDataSource>(
      () => CustomerRemoteDataSource(sl(), firestore: sl(), session: sl()),
    );

    /// Repository
    sl.registerLazySingleton<CustomerRepository>(
      () => CustomerRepositoryImpl(sl()),
    );

    // usecases
    sl.registerLazySingleton(() => StreamCustomers(sl()));
    sl.registerLazySingleton(() => CreateCustomer(sl()));
    sl.registerLazySingleton(() => UpdateCustomer(sl()));
    sl.registerLazySingleton(
      () => DeleteCustomer(repository: sl(), session: sl()),
    );

    // cubit
    sl.registerFactory(() => CustomerCubit(sl()));
    sl.registerFactory(() => CustomerActionCubit(sl(), sl(), sl()));
  }
}
