// =============================================================================
// File        : app_snackbar_theme.dart
// Path        : lib/core/theme/components/app_snackbar_theme.dart
// Layer       : Core (Theme)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan global SnackBar theme
// - Mengatur:
//   - floating behavior
//   - shape
//   - typography
//   - action color
//   - close icon
//   - spacing
// =============================================================================

import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class AppSnackBarTheme {
  const AppSnackBarTheme._();

  // =========================
  // BUILD
  // =========================

  static SnackBarThemeData build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    final radius = AppRadius();
    final spacing = AppSpacing();

    return SnackBarThemeData(
      // =========================
      // LAYOUT
      // =========================
      behavior: SnackBarBehavior.floating,
      elevation: 2,

      insetPadding: EdgeInsets.symmetric(
        horizontal: spacing.lg,
        vertical: spacing.md,
      ),

      // =========================
      // SHAPE
      // =========================
      shape: RoundedRectangleBorder(borderRadius: radius.md.r),

      // =========================
      // TEXT
      // =========================
      contentTextStyle: text.bodyMedium?.copyWith(
        color: cs.onInverseSurface,
        fontWeight: FontWeight.w500,
      ),

      // =========================
      // ACTION
      // =========================
      actionTextColor: cs.inversePrimary,

      // =========================
      // CLOSE ICON
      // =========================
      showCloseIcon: true,

      closeIconColor: cs.onInverseSurface.withValues(alpha: 0.8),
    );
  }
}
