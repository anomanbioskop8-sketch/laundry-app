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
  final SessionCubit session;

  const RouterGuard(this.session);

  String? redirect(BuildContext context, GoRouterState state) {
    final location = state.matchedLocation;

    final isSplash = location == AuthPaths.splash;
    final isLogin = location == AuthPaths.login;
    final isRegister = location == AuthPaths.register;
    final isSubscription = location == SubscriptionPaths.subscription;

    // loading
    if (session.isLoading) {
      return isSplash ? null : AuthPaths.splash;
    }

    // belum login
    if (!session.isActive) {
      return (isLogin || isRegister) ? null : AuthPaths.login;
    }

    final company = session.company;

    // company masih loading
    if (company == null) {
      return null;
    }

    // subscription expired
    if (company.isExpired) {
      if (isSubscription) return null;

      return SubscriptionPaths.subscription;
    }

    // block auth page
    if (isSplash || isLogin || isRegister) {
      return MainPaths.main;
    }

    return null;
  }
}
