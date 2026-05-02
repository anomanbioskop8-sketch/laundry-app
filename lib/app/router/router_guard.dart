// import 'package:app_laundry/app/router/route_paths.dart';
// import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
// import 'package:app_laundry/features/auth/presentation/cubit/auth_state.dart';
// import 'package:go_router/go_router.dart';

// class RouterGuard {
//   final AuthCubit authCubit;

//   RouterGuard(this.authCubit);

//   String? redirectLogic(GoRouterState state) {
//     final authState = authCubit.state;

//     final isSplashRoute = state.matchedLocation == RoutePaths.splash;
//     final isLoginRoute = state.matchedLocation == RoutePaths.login;
//     final isRegisterRoute = state.matchedLocation == RoutePaths.register;

//     return authState.when(
//       initial: () => null,

//       loading: () => RoutePaths.splash,

//       authenticated: (user) {
//         if (isLoginRoute || isRegisterRoute || isSplashRoute) {
//           return RoutePaths.main;
//         }
//         return null;
//       },

//       unauthenticated: () {
//         if (isLoginRoute || isRegisterRoute) return null;
//         return RoutePaths.login;
//       },

//       error: (_) => RoutePaths.login,
//     );
//   }
// }

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:go_router/go_router.dart';

class RouterGuard {
  final SessionCubit session;

  RouterGuard(this.session);

  String? redirect(GoRouterState state) {
    final location = state.matchedLocation;

    final isSplash = location == RoutePaths.splash;
    final isLogin = location == RoutePaths.login;
    final isRegister = location == RoutePaths.register;

    final isLoggedIn = session.isActive;

    // =========================
    // 🔥 SESSION LOADING
    // =========================
    if (session.isLoading) {
      return isSplash ? null : RoutePaths.splash;
    }

    // =========================
    // SESSION BELUM ADA
    // =========================
    if (!isLoggedIn) {
      // tetap boleh di login/register
      if (isLogin || isRegister) return null;

      // selain itu → ke login
      return RoutePaths.login;
    }

    // =========================
    // SUDAH LOGIN
    // =========================
    if (isLogin || isRegister || isSplash) {
      return RoutePaths.main;
    }

    return null;
  }
}
