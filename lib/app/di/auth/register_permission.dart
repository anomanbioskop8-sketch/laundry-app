// =============================================================================
// File : register_permission.dart
// Path : lib/app/di/auth/register_permission.dart
// -----------------------------------------------------------------------------
// Fungsi:
// - Register permission system
// - Register policy resolver
// - Register permission policy
// - Register permission service
// =============================================================================

import 'package:app_laundry/core/auth/policy/customer/customer_policy.dart';
import 'package:app_laundry/core/auth/policy/order/order_policy.dart';
import 'package:app_laundry/core/auth/policy/permission_policy.dart';
import 'package:app_laundry/core/auth/permission/policy_resolver.dart';
import 'package:app_laundry/core/auth/permission/permission_service.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:get_it/get_it.dart';

// =============================================================================
// REGISTER PERMISSION SYSTEM
// =============================================================================

void registerPermission(GetIt sl) {
  // =========================
  // POLICY RESOLVER
  // =========================

  sl.registerLazySingleton<PolicyResolver>(
    () => PolicyResolver(
      customerPolicy: sl<CustomerPolicy>(),
      orderPolicy: sl<OrderPolicy>(),
    ),
  );

  // =========================
  // PERMISSION POLICY
  // =========================

  sl.registerLazySingleton<PermissionPolicy>(
    () => PermissionPolicy(
      resolver: sl<PolicyResolver>(),
      session: sl<SessionService>(),
    ),
  );

  // =========================
  // PERMISSION SERVICE
  // =========================

  sl.registerLazySingleton<PermissionService>(
    () => PermissionService(sl<PermissionPolicy>()),
  );
}
