// =============================================================================
// File        : app_snackbar.dart
// Path        : lib/core/services/app_snackbar.dart
// Layer       : Core (UI Service)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menampilkan snackbar global tanpa perlu BuildContext
// - Digunakan oleh Cubit / Service layer
// - Menjaga konsistensi feedback UI
//
// Features:
// - Floating snackbar
// - Global access via AppNavigator
// - Semantic success & error state
// - Custom margin & rounded style
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/services/app_navigator.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

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
      icon: AppIcons.success,
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
      icon: AppIcons.error,
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
        content: _SnackbarContent(message: message, icon: icon, color: color),
      ),
    );
  }
}

// =============================================================================
// SNACKBAR CONTENT
// =============================================================================

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
