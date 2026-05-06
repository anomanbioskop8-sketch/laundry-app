// =============================================================================
// File        : app_router.dart
// Path        : lib/app/router/app_router.dart
// Layer       : App (Routing)
// -----------------------------------------------------------------------------
// Fungsi:
// - Konfigurasi navigasi aplikasi menggunakan GoRouter
// - Mengatur route, redirect (auth guard), dan refresh berdasarkan session
// =============================================================================

import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/go_router_refresh_stream.dart';
import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/app/router/router_guard.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/features/auth/presentation/pages/login_page_wrapper.dart';
import 'package:app_laundry/features/auth/presentation/pages/register_page.dart';
import 'package:app_laundry/features/auth/presentation/pages/splash_page.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_detail_page.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_form_page_wrapper.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_page_wrapper.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/presentation/pages/laundry_item_form_page_wrapper.dart';
import 'package:app_laundry/features/main/presentation/pages/main_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  /// =========================
  /// DEPENDENCIES
  /// =========================
  final SessionCubit sessionCubit;
  final RouterGuard guard;

  AppRouter()
    : sessionCubit = sl<SessionCubit>(),
      guard = RouterGuard(sl<SessionCubit>()) {
    /// 🔥 init session sekali saja
    sessionCubit.init();
  }

  /// =========================
  /// ROUTER
  /// =========================
  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    navigatorKey: AppNavigator.navigatorKey,

    /// 🔥 auto refresh saat session berubah
    refreshListenable: GoRouterRefreshStream(sessionCubit.stream),

    /// 🔥 centralized guard
    redirect: guard.redirect,

    routes: [
      /// =========================
      /// AUTH
      /// =========================
      GoRoute(
        path: RoutePaths.splash,
        name: RoutePaths.splashName,
        builder: (_, _) => const SplashPage(),
      ),
      GoRoute(
        path: RoutePaths.login,
        name: RoutePaths.loginName,
        builder: (_, _) => const LoginPageWrapper(),
      ),
      GoRoute(
        path: RoutePaths.register,
        name: RoutePaths.registerName,
        builder: (_, _) => const RegisterPage(),
      ),

      /// =========================
      /// MAIN
      /// =========================
      GoRoute(
        path: RoutePaths.main,
        name: RoutePaths.mainName,
        builder: (_, _) => const MainPage(),
      ),

      /// =========================
      /// CUSTOMER MODULE
      /// =========================
      GoRoute(
        path: RoutePaths.customers,
        name: RoutePaths.customersName,
        builder: (_, _) => const CustomerPageWrapper(),
      ),
      GoRoute(
        path: RoutePaths.customerForm,
        name: RoutePaths.customerFormName,
        builder: (context, state) {
          final customer = state.extra as CustomerEntity?;
          return CustomerFormPageWrapper(customer: customer);
        },
      ),
      GoRoute(
        path: RoutePaths.customerDetail,
        name: RoutePaths.customerDetailName,
        builder: (context, state) {
          final customer = state.extra as CustomerEntity;
          return CustomerDetailPage(customer: customer);
        },
      ),

      /// =========================
      /// LAUNDRY ITEM MODULE
      /// =========================
      GoRoute(
        path: RoutePaths.laundryItemForm,
        name: RoutePaths.laundryItemFormName,
        builder: (context, state) {
          final item = state.extra as LaundryItemEntity?;
          return LaundryItemFormPageWrapper(item: item);
        },
      ),
    ],
  );
}
