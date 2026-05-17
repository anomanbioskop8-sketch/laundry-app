// =============================================================================
// File        : router_guard.dart
// Path        : lib/app/router/router_guard.dart
// Layer       : App (Routing)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menangani redirect / auth guard pada GoRouter
// - Mengontrol akses route berdasarkan status session user
//
// Responsibility:
// - Redirect ke splash saat session masih loading
// - Redirect ke login jika belum login
// - Mencegah user login mengakses halaman auth
// - Mengarahkan user login ke main page
//
// Flow:
// 1. Session loading
//    → paksa ke splash
//
// 2. Belum login
//    → hanya boleh akses:
//      - login
//      - register
//
// 3. Sudah login
//    → halaman auth akan diarahkan ke main
//
// Notes:
// - Digunakan oleh GoRouter.redirect
// - Bergantung pada SessionCubit
// - Dipanggil otomatis setiap route berubah
// =============================================================================

import 'package:app_laundry/app/router/route_paths.dart';
import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterGuard {
  // =========================
  // DEPENDENCY
  // =========================

  final SessionCubit session;

  const RouterGuard(this.session);

  // =========================
  // ROUTE REDIRECT
  // =========================

  String? redirect(BuildContext context, GoRouterState state) {
    // =========================
    // CURRENT LOCATION
    // =========================

    final location = state.matchedLocation;

    // =========================
    // AUTH ROUTES
    // =========================

    final isSplash = location == AuthPaths.splash;

    final isLogin = location == AuthPaths.login;

    final isRegister = location == AuthPaths.register;

    // =========================
    // SESSION STATE
    // =========================

    final isLoggedIn = session.isActive;

    // =========================
    // SESSION LOADING
    // =========================

    if (session.isLoading) {
      return isSplash ? null : AuthPaths.splash;
    }

    // =========================
    // USER BELUM LOGIN
    // =========================

    if (!isLoggedIn) {
      // tetap boleh akses halaman auth
      if (isLogin || isRegister) {
        return null;
      }

      // selain auth → redirect login
      return AuthPaths.login;
    }

    // =========================
    // USER SUDAH LOGIN
    // =========================

    if (isSplash || isLogin || isRegister) {
      return MainPaths.main;
    }

    // =========================
    // ALLOW ACCESS
    // =========================

    return null;
  }
}
