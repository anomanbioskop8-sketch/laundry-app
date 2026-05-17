// =============================================================================
// File        : app_router.dart
// Path        : lib/app/router/app_router.dart
// =============================================================================

import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/go_router_refresh_stream.dart';
import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/app/router/router_guard.dart';
import 'package:app_laundry/app/router/routes/auth_routes.dart';
import 'package:app_laundry/app/router/routes/customer_routes.dart';
import 'package:app_laundry/app/router/routes/laundry_item_routes.dart';
import 'package:app_laundry/app/router/routes/laundry_price_routes.dart';
import 'package:app_laundry/app/router/routes/main_routes.dart';
import 'package:app_laundry/app/router/routes/order_routes.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  // =========================
  // DEPENDENCIES
  // =========================

  final SessionCubit sessionCubit;
  final RouterGuard guard;

  AppRouter()
    : sessionCubit = sl<SessionCubit>(),
      guard = RouterGuard(sl<SessionCubit>()) {
    sessionCubit.init();
  }

  // =========================
  // ROUTER
  // =========================

  late final GoRouter router = GoRouter(
    initialLocation: AuthPaths.splash,

    navigatorKey: AppNavigator.navigatorKey,

    refreshListenable: GoRouterRefreshStream(sessionCubit.stream),

    redirect: guard.redirect,

    routes: [
      ...AuthRoutes.routes,
      ...MainRoutes.routes,
      ...CustomerRoutes.routes,
      ...LaundryItemRoutes.routes,
      ...LaundryPriceRoutes.routes,
      ...OrderRoutes.routes,
    ],
  );
}
