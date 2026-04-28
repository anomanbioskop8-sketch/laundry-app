import 'package:app_laundry/app/router/app_router.dart';
import 'package:app_laundry/app/router/router_guard.dart';
import 'package:app_laundry/core/network/base_remote_datasource.dart';
import 'package:app_laundry/core/services/permission/permission_service.dart';
import 'package:app_laundry/core/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/session/data/services/session_service_impl.dart';
import 'package:app_laundry/core/session/domain/services/session_service.dart';
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

  sl.registerLazySingleton<SessionCubit>(() => SessionCubit());

  sl.registerLazySingleton<SessionService>(() => SessionServiceImpl(sl()));

  sl.registerLazySingleton<PermissionService>(() => PermissionService(sl()));

  //sl.registerLazySingleton<AppRouter>(() => AppRouter(sl()));

  /// Base services
  // sl.registerLazySingleton<BaseRemoteDataSource>(
  //   () => BaseRemoteDataSource(sl()),
  // );
}
