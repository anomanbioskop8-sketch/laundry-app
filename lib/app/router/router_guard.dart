import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:app_laundry/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RouterGuard {
  final AuthCubit authCubit;

  RouterGuard(this.authCubit);

  String? redirectLogic(GoRouterState state) {
    final authState = authCubit.state;

    final isSplashRoute = state.matchedLocation == RoutePaths.splash;
    final isLoginRoute = state.matchedLocation == RoutePaths.login;
    final isRegisterRoute = state.matchedLocation == RoutePaths.register;

    return authState.when(
      initial: () => isSplashRoute ? null : RoutePaths.splash,

      loading: () => isSplashRoute ? null : RoutePaths.splash,

      authenticated: (user) {
        if (isLoginRoute || isRegisterRoute || isSplashRoute) {
          return RoutePaths.customers;
        }
        return null;
      },

      unauthenticated: () {
        if (isLoginRoute || isRegisterRoute) return null;
        return RoutePaths.login;
      },

      error: (_) => RoutePaths.login,
    );
  }
}
