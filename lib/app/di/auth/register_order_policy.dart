// =============================================================================
// File : register_order_policy.dart
// Path : lib/app/di/auth/register_order_policy.dart
// -----------------------------------------------------------------------------
// Fungsi:
// - Register seluruh dependency authorization order
// - Register policy update order
// - Register policy delete order
// - Register policy payment order
// - Register policy status order
// - Register aggregate OrderPolicy
// =============================================================================

import 'package:app_laundry/core/auth/policy/order/order_delete_policy.dart';

import 'package:app_laundry/core/auth/policy/order/order_payment_policy.dart';

import 'package:app_laundry/core/auth/policy/order/order_policy.dart';

import 'package:app_laundry/core/auth/policy/order/order_status_policy.dart';

import 'package:app_laundry/core/auth/policy/order/order_update_policy.dart';

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';

import 'package:get_it/get_it.dart';

// =============================================================================
// REGISTER ORDER POLICY
// =============================================================================

void registerOrderPolicy(GetIt sl) {
  // =========================
  // DELETE POLICY
  // =========================

  sl.registerLazySingleton<OrderDeletePolicy>(
    () => OrderDeletePolicy(sl<SessionService>()),
  );

  // =========================
  // UPDATE POLICY
  // =========================

  sl.registerLazySingleton<OrderUpdatePolicy>(
    () => OrderUpdatePolicy(sl<SessionService>()),
  );

  // =========================
  // PAYMENT POLICY
  // =========================

  sl.registerLazySingleton<OrderPaymentPolicy>(
    () => OrderPaymentPolicy(sl<SessionService>()),
  );

  // =========================
  // STATUS POLICY
  // =========================

  sl.registerLazySingleton<OrderStatusPolicy>(
    () => OrderStatusPolicy(sl<SessionService>()),
  );

  // =========================
  // ORDER POLICY
  // =========================

  sl.registerLazySingleton<OrderPolicy>(
    () => OrderPolicy(
      deletePolicy: sl<OrderDeletePolicy>(),

      updatePolicy: sl<OrderUpdatePolicy>(),

      paymentPolicy: sl<OrderPaymentPolicy>(),

      statusPolicy: sl<OrderStatusPolicy>(),
    ),
  );
}
