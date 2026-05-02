import 'package:app_laundry/app/di/injection_container.dart';
import 'package:app_laundry/app/router/go_router_refresh_stream.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/features/auth/presentation/pages/login_page_wrapper.dart';
import 'package:app_laundry/features/auth/presentation/pages/splash_page.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_form_page_wrapper.dart';
import 'package:app_laundry/features/customer/presentation/pages/customer_page_wrapper.dart';
import 'package:app_laundry/features/main/presentation/pages/main_page.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';
import 'router_guard.dart';

class AppRouter {
  final sessionCubit = sl<SessionCubit>()..init();
  AppRouter();

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    navigatorKey: AppNavigator.navigatorKey,
    refreshListenable: GoRouterRefreshStream(sessionCubit.stream),
    redirect: (context, state) {
      return RouterGuard(sessionCubit).redirect(state);
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
        builder: (context, state) => const LoginPageWrapper(),
      ),

      // GoRoute(
      //   path: RoutePaths.register,
      //   builder: (context, state) => const RegisterPage(),
      // ),

      /// =========================
      /// HOME (SHELL / MAIN APP)
      /// =========================
      GoRoute(
        path: RoutePaths.main,
        builder: (context, state) => const MainPage(),
        // redirect: (context, state) {
        //   final session = context.read<SessionCubit>();

        //   if (!session.isActive) return '/login';
        //   return null;
        // },
      ),

      /// =========================
      /// MODULES (SAAS FEATURES)
      /// =========================
      GoRoute(
        path: RoutePaths.customers,
        builder: (context, state) => const CustomerPageWrapper(),
      ),
      GoRoute(
        path: '/customer/form',
        name: 'customerForm',
        builder: (context, state) {
          final customer = state.extra as CustomerEntity?;
          return CustomerFormPageWrapper(customer: customer);
        },
      ),
    ],
  );
}
