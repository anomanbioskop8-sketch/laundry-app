// =============================================================================
// File        : auth_routes.dart
// Path        : lib/app/router/routes/auth_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/auth/presentation/wrappers/login_page_wrapper.dart';
import 'package:app_laundry/features/auth/presentation/pages/register_page.dart';
import 'package:app_laundry/features/auth/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  AuthRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: AuthPaths.splashPath,
      name: AuthPaths.splash,
      builder: (_, _) => const SplashPage(),
    ),

    GoRoute(
      path: AuthPaths.loginPath,
      name: AuthPaths.login,
      builder: (_, _) => const LoginPageWrapper(),
    ),

    GoRoute(
      path: AuthPaths.registerPath,
      name: AuthPaths.register,
      builder: (_, _) => const RegisterPage(),
    ),
  ];
}
