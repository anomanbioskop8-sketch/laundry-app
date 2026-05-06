// =============================================================================
// File        : register_core.dart
// Path        : lib/app/di/register_core.dart
// Layer       : Core (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency global (logger, firebase, session, permission)
// =============================================================================

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
import 'package:app_laundry/features/auth/domain/usecases/get_current_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

Future<void> registerCore(GetIt sl) async {
  _logger(sl);
  _firebase(sl);
  _session(sl);
  _policy(sl);
  _permission(sl);
}

// =========================
// LOGGER
// =========================
void _logger(GetIt sl) {
  sl.registerLazySingleton<LoggerService>(() => AppLogger());
}

// =========================
// FIREBASE
// =========================
void _firebase(GetIt sl) {
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}

// =========================
// SESSION
// =========================
void _session(GetIt sl) {
  /// 🔥 SessionCubit = source of truth (UI state)
  sl.registerLazySingleton<SessionCubit>(
    () => SessionCubit(sl<GetCurrentUser>()),
  );

  /// 🔥 SessionService = abstraction untuk domain layer
  sl.registerLazySingleton<SessionService>(
    () => SessionServiceImpl(sl<SessionCubit>()),
  );
}

// =========================
// POLICY (AUTHORIZATION)
// =========================
void _policy(GetIt sl) {
  /// granular policy
  sl.registerLazySingleton<CustomerDeletePolicy>(
    () => CustomerDeletePolicy(sl<SessionService>()),
  );

  sl.registerLazySingleton<CustomerUpdatePolicy>(
    () => CustomerUpdatePolicy(sl<SessionService>()),
  );

  /// aggregate policy
  sl.registerLazySingleton<CustomerPolicy>(
    () => CustomerPolicy(
      deletePolicy: sl<CustomerDeletePolicy>(),
      updatePolicy: sl<CustomerUpdatePolicy>(),
    ),
  );
}

// =========================
// PERMISSION SYSTEM
// =========================
void _permission(GetIt sl) {
  /// 🔥 resolve policy berdasarkan context (dynamic)
  sl.registerLazySingleton<PolicyResolver>(
    () => PolicyResolver(customerPolicy: sl()),
  );

  /// 🔥 central permission checker
  sl.registerLazySingleton<PermissionPolicy>(
    () => PermissionPolicy(
      resolver: sl<PolicyResolver>(),
      session: sl<SessionService>(),
    ),
  );

  /// 🔥 digunakan oleh UI / Cubit
  sl.registerLazySingleton<PermissionService>(
    () => PermissionService(sl<PermissionPolicy>()),
  );
}
