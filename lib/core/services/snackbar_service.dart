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

import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
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

class AppSnackbar1 {
  AppSnackbar1._();

  // =========================
  // SUCCESS
  // =========================
  static void success(BuildContext context, String message) {
    _show(
      context,
      message: message,
      icon: Icons.check_circle_rounded,
      color: context.status.success,
    );
  }

  // =========================
  // ERROR
  // =========================
  static void error(BuildContext context, String message) {
    _show(
      context,
      message: message,
      icon: Icons.error_rounded,
      color: context.status.error,
    );
  }

  // =========================
  // CORE
  // =========================
  static void _show(
    BuildContext context, {
    required String message,
    required IconData icon,
    required Color color,
  }) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    messenger.showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: _SnackbarContent(message: message, icon: icon, color: color),
      ),
    );
  }
}

class _SnackbarContent extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color color;

  const _SnackbarContent({
    required this.message,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: AppSpacing.sm),
        Expanded(child: Text(message)),
      ],
    );
  }
}
