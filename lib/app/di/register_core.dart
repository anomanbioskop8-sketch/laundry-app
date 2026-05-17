import 'package:app_laundry/app/router/navigation_service.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_delete_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_policy.dart';
import 'package:app_laundry/core/auth/policy/customer/customer_update_policy.dart';

import 'package:app_laundry/core/auth/policy/order/order_delete_policy.dart';
import 'package:app_laundry/core/auth/policy/order/order_payment_policy.dart';
import 'package:app_laundry/core/auth/policy/order/order_policy.dart';
import 'package:app_laundry/core/auth/policy/order/order_status_policy.dart';
import 'package:app_laundry/core/auth/policy/order/order_update_policy.dart';

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
  _navigation(sl);
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
  sl.registerLazySingleton<SessionCubit>(
    () => SessionCubit(sl<GetCurrentUser>()),
  );

  sl.registerLazySingleton<SessionService>(
    () => SessionServiceImpl(sl<SessionCubit>()),
  );
}

// =========================
// POLICY (AUTHORIZATION)
// =========================
void _policy(GetIt sl) {
  // =========================
  // CUSTOMER POLICY
  // =========================
  sl.registerLazySingleton<CustomerDeletePolicy>(
    () => CustomerDeletePolicy(sl<SessionService>()),
  );

  sl.registerLazySingleton<CustomerUpdatePolicy>(
    () => CustomerUpdatePolicy(sl<SessionService>()),
  );

  sl.registerLazySingleton<CustomerPolicy>(
    () => CustomerPolicy(
      deletePolicy: sl<CustomerDeletePolicy>(),
      updatePolicy: sl<CustomerUpdatePolicy>(),
    ),
  );

  // =========================
  // ORDER POLICY (NEW)
  // =========================
  sl.registerLazySingleton<OrderDeletePolicy>(
    () => OrderDeletePolicy(sl<SessionService>()),
  );

  sl.registerLazySingleton<OrderUpdatePolicy>(
    () => OrderUpdatePolicy(sl<SessionService>()),
  );

  sl.registerLazySingleton<OrderPaymentPolicy>(
    () => OrderPaymentPolicy(sl<SessionService>()),
  );

  sl.registerLazySingleton<OrderStatusPolicy>(
    () => OrderStatusPolicy(sl<SessionService>()),
  );

  sl.registerLazySingleton<OrderPolicy>(
    () => OrderPolicy(
      deletePolicy: sl<OrderDeletePolicy>(),
      updatePolicy: sl<OrderUpdatePolicy>(),
      paymentPolicy: sl<OrderPaymentPolicy>(),
      statusPolicy: sl<OrderStatusPolicy>(),
    ),
  );
}

// =========================
// PERMISSION SYSTEM
// =========================
void _permission(GetIt sl) {
  sl.registerLazySingleton<PolicyResolver>(
    () => PolicyResolver(
      customerPolicy: sl<CustomerPolicy>(),
      orderPolicy: sl<OrderPolicy>(),
    ),
  );

  sl.registerLazySingleton<PermissionPolicy>(
    () => PermissionPolicy(
      resolver: sl<PolicyResolver>(),
      session: sl<SessionService>(),
    ),
  );

  sl.registerLazySingleton<PermissionService>(
    () => PermissionService(sl<PermissionPolicy>()),
  );
}

// =========================
// NAVIGATION
// =========================
void _navigation(GetIt sl) {
  sl.registerLazySingleton<NavigationService>(() => NavigationService(sl()));
}
