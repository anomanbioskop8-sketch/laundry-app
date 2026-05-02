import 'package:app_laundry/core/auth/policy/customer/customer_delete_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_update_policy.dart';
import 'package:app_laundry/core/auth/policy/permission_policy.dart';
import 'package:app_laundry/core/auth/permission/policy_resolver.dart';
import 'package:app_laundry/core/auth/permission/permission_service.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/auth/session/data/services/session_service_impl.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/utils/logger_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

Future<void> registerCore(GetIt sl) async {
  /// Logger
  sl.registerLazySingleton<LoggerService>(() => AppLogger());

  /// Firebase
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<SessionCubit>(() => SessionCubit(sl()));

  sl.registerLazySingleton<SessionService>(() => SessionServiceImpl(sl()));

  sl.registerLazySingleton(() => CustomerDeletePolicy(sl()));
  sl.registerLazySingleton(() => CustomerUpdatePolicy(sl()));

  sl.registerLazySingleton(
    () =>
        CustomerPolicy(sl<CustomerDeletePolicy>(), sl<CustomerUpdatePolicy>()),
  );
  //sl.registerLazySingleton(() => OrderPolicy(sl()));

  sl.registerLazySingleton(() => PolicyResolver(sl()));

  sl.registerLazySingleton(() => PermissionPolicy(sl(), sl()));

  sl.registerLazySingleton(() => PermissionService(sl()));

  //sl.registerLazySingleton<AppRouter>(() => AppRouter(sl()));

  /// Base services
  // sl.registerLazySingleton<BaseRemoteDataSource>(
  //   () => BaseRemoteDataSource(sl()),
  // );
}
