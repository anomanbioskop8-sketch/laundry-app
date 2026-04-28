import 'package:app_laundry/app/router/go_router_refresh_stream.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:app_laundry/features/auth/presentation/pages/splash_page.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_page_wrapper.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import 'router_guard.dart';

// pages
import '../../features/auth/presentation/pages/login_page.dart';

class AppRouter {
  final AuthCubit authCubit;
  AppRouter(this.authCubit);

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    navigatorKey: AppNavigator.navigatorKey,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    redirect: (context, state) {
      return RouterGuard(authCubit).redirectLogic(state);
    },

    routes: [
      /// =========================
      /// AUTH
      /// =========================
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashPage(),
      ),

      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const LoginPage(),
      ),

      // GoRoute(
      //   path: RoutePaths.register,
      //   builder: (context, state) => const RegisterPage(),
      // ),

      /// =========================
      /// HOME (SHELL / MAIN APP)
      /// =========================
      // GoRoute(
      //   path: RoutePaths.home,
      //   builder: (context, state) => const HomePage(),
      // ),

      /// =========================
      /// MODULES (SAAS FEATURES)
      /// =========================
      GoRoute(
        path: RoutePaths.customers,
        builder: (context, state) => const CustomerPageWrapper(),
      ),
    ],
  );
}
