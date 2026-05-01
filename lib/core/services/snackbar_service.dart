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

import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';
import 'app_navigator.dart';

class AppSnackbar {
  AppSnackbar._();

  // =========================
  // SUCCESS
  // =========================
  static void success(String message) {
    final context = AppNavigator.navigatorKey.currentContext;
    if (context == null) return;
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
  static void error(String message) {
    final context = AppNavigator.navigatorKey.currentContext;
    if (context == null) return;
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
        context.spacing.sm.w,
        Expanded(child: Text(message)),
      ],
    );
  }
}
