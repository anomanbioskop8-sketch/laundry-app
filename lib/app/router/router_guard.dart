// =============================================================================
// File        : router_guard.dart
// Path        : lib/app/router/router_guard.dart
// Layer       : App (Routing)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menangani redirect / auth guard pada GoRouter
// - Mengontrol akses route berdasarkan status session user
// =============================================================================

import 'package:app_laundry/app/router/paths/auth_paths.dart';
import 'package:app_laundry/app/router/paths/main_paths.dart';
import 'package:app_laundry/app/router/paths/subscription_paths.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterGuard {
  final SessionCubit _session;

  const RouterGuard(this._session);

  String? redirect(BuildContext context, GoRouterState state) {
    final location = state.matchedLocation;

    final isSplash = location == AuthPaths.splashPath;
    final isLogin = location == AuthPaths.loginPath;
    final isRegister = location == AuthPaths.registerPath;
    final isSubscription = location == SubscriptionPaths.subscriptionPath;

    // loading
    if (_session.isLoading) {
      return isSplash ? null : AuthPaths.splashPath;
    }

    // belum login
    if (!_session.isActive) {
      return (isLogin || isRegister) ? null : AuthPaths.loginPath;
    }

    final company = _session.company;

    // company masih loading
    if (company == null) {
      return null;
    }

    // subscription expired
    if (company.isExpired) {
      if (isSubscription) return null;

      return SubscriptionPaths.subscriptionPath;
    }

    // block auth page
    if (isSplash || isLogin || isRegister) {
      return MainPaths.mainPath;
    }

    return null;
  }
}
