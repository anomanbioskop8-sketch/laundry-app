// =============================================================================
// File : register_customer_policy.dart
// Path : lib/app/di/auth/register_customer_policy.dart
// -----------------------------------------------------------------------------
// Fungsi:
// - Register seluruh dependency authorization customer
// - Register policy update customer
// - Register policy delete customer
// - Register aggregate CustomerPolicy
// =============================================================================

import 'package:app_laundry/core/auth/policy/customer/customer_delete_policy.dart';

import 'package:app_laundry/core/auth/policy/customer/customer_policy.dart';

import 'package:app_laundry/core/auth/policy/customer/customer_update_policy.dart';

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';

import 'package:get_it/get_it.dart';

// =============================================================================
// REGISTER CUSTOMER POLICY
// =============================================================================

void registerCustomerPolicy(GetIt sl) {
  // =========================
  // DELETE POLICY
  // =========================

  sl.registerLazySingleton<CustomerDeletePolicy>(
    () => CustomerDeletePolicy(sl<SessionService>()),
  );

  // =========================
  // UPDATE POLICY
  // =========================

  sl.registerLazySingleton<CustomerUpdatePolicy>(
    () => CustomerUpdatePolicy(sl<SessionService>()),
  );

  // =========================
  // CUSTOMER POLICY
  // =========================

  sl.registerLazySingleton<CustomerPolicy>(
    () => CustomerPolicy(
      deletePolicy: sl<CustomerDeletePolicy>(),

      updatePolicy: sl<CustomerUpdatePolicy>(),
    ),
  );
}
