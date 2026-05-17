// =============================================================================
// File        : auth_routes.dart
// Path        : lib/app/router/routes/auth_routes.dart
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/features/auth/presentation/pages/login_page_wrapper.dart';
import 'package:app_laundry/features/auth/presentation/pages/register_page.dart';
import 'package:app_laundry/features/auth/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  AuthRoutes._();

  static final routes = <GoRoute>[
    GoRoute(
      path: AuthPaths.splash,
      name: AuthPaths.splashName,
      builder: (_, _) => const SplashPage(),
    ),

    GoRoute(
      path: AuthPaths.login,
      name: AuthPaths.loginName,
      builder: (_, _) => const LoginPageWrapper(),
    ),

    GoRoute(
      path: AuthPaths.register,
      name: AuthPaths.registerName,
      builder: (_, _) => const RegisterPage(),
    ),
  ];
}
