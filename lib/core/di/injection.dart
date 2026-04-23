import 'package:app_laundry/features/customers/data/datasources/customer_remote_datasource.dart';
import 'package:app_laundry/features/customers/data/repositories/customer_repository_impl.dart';
import 'package:app_laundry/features/customers/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customers/domain/usecases/create_customer_usecase.dart';
import 'package:app_laundry/features/customers/domain/usecases/delete_customer_usecase.dart';
import 'package:app_laundry/features/customers/domain/usecases/stream_customers_usecase.dart';
import 'package:app_laundry/features/customers/domain/usecases/update_customer_usecase.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_action_cubit.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_cubit.dart';
import 'package:app_laundry/features/customers/presentation/cubit/customer_form_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  /// ===============================
  /// 🔹 FIREBASE
  /// ===============================
  getIt.registerLazySingleton(() => FirebaseAuth.instance);
  getIt.registerLazySingleton(() => FirebaseFirestore.instance);

  /// ===============================
  /// 🔹 DATASOURCES
  /// ===============================
  //getIt.registerLazySingleton(() => AuthRemoteDataSource(getIt()));

  //getIt.registerLazySingleton(() => UserRemoteDataSource(getIt()));

  getIt.registerLazySingleton(() => CustomerRemoteDataSource(getIt()));

  /// ===============================
  /// 🔹 REPOSITORIES
  /// ===============================
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(getIt(), getIt()),
  // );

  getIt.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(getIt()),
  );

  /// ===============================
  /// 🔹 USECASES
  /// ===============================
  //getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  //getIt.registerLazySingleton(() => RegisterUseCase(getIt()));

  getIt.registerLazySingleton(() => CreateCustomerUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateCustomerUseCase(getIt()));
  getIt.registerLazySingleton(() => DeleteCustomerUseCase(getIt()));
  getIt.registerLazySingleton(() => StreamCustomersUseCase(getIt()));

  /// ===============================
  /// 🔹 CUBITS
  /// ===============================
  //getIt.registerFactory(() => AuthCubit(getIt(), getIt()));

  getIt.registerFactory(() => CustomerCubit(getIt()));

  getIt.registerFactory(() => CustomerActionCubit(getIt(), getIt(), getIt()));

  getIt.registerFactory(() => CustomerFormCubit(getIt()));
}
