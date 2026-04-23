// =============================================================================
// File        : app_snackbar.dart
// Path        : core/services/app_snackbar.dart
// Layer       : Core (UI Service)
// -----------------------------------------------------------------------------
// Global Snackbar Service.
//
// Responsibility:
// - Menampilkan snackbar global tanpa perlu BuildContext.
// - Digunakan oleh Cubit / Service layer (bukan langsung dari UI).
// - Menjaga konsistensi UI feedback (success, error, info).
//
// Notes:
// - Bergantung pada AppNavigator.messengerKey.
// - Pastikan sudah di-assign di MaterialApp.
// =============================================================================

import 'package:flutter/material.dart';
import 'app_navigator.dart';

class AppSnackbar {
  AppSnackbar._(); // ❌ prevent instantiation

  // ===========================================================================
  // PUBLIC API
  // ===========================================================================

  /// Menampilkan snackbar sukses (warna hijau)
  static void success(String message) {
    _show(message: message, backgroundColor: Colors.green);
  }

  /// Menampilkan snackbar error (warna merah)
  static void error(String message) {
    _show(message: message, backgroundColor: Colors.red);
  }

  /// Menampilkan snackbar informasi (warna biru)
  static void info(String message) {
    _show(message: message, backgroundColor: Colors.blue);
  }

  // ===========================================================================
  // CORE IMPLEMENTATION
  // ===========================================================================

  static void _show({
    required String message,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    final messenger = AppNavigator.messengerKey.currentState;

    // 🔒 Safety check: jika belum ada context (misalnya app belum ready)
    if (messenger == null) return;

    // 🔄 Hapus snackbar sebelumnya agar tidak numpuk
    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: behavior,
      ),
    );
  }
}
