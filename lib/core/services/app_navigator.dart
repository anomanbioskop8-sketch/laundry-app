// =============================================================================
// File        : app_navigator.dart
// Path        : core/services/app_navigator.dart
// Layer       : Core (Navigation Service)
// -----------------------------------------------------------------------------
// AppNavigator
//
// Responsibility:
// - Menyediakan GlobalKey untuk navigasi dan snackbar global.
// - Digunakan oleh service layer (Dialog, Snackbar, Loading, dll).
// - Menghindari penggunaan BuildContext di seluruh aplikasi.
//
// Usage:
// - Pasang di MaterialApp:
//     navigatorKey: AppNavigator.navigatorKey,
//     scaffoldMessengerKey: AppNavigator.messengerKey,
//
// Notes:
// - Harus diinisialisasi di root app (MaterialApp / CupertinoApp).
// - Menjadi dependency utama untuk AppUIService.
// =============================================================================

import 'package:flutter/material.dart';

class AppNavigator {
  AppNavigator._(); // ❌ prevent instantiation

  // ===========================================================================
  // NAVIGATOR KEY
  // ===========================================================================
  //
  // Digunakan untuk:
  // - Navigation (push, pop, dll)
  // - Mengambil context global (dialog, overlay)
  //

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  // ===========================================================================
  // MESSENGER KEY
  // ===========================================================================
  //
  // Digunakan untuk:
  // - Snackbar global (tanpa context)
  //

  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
}
