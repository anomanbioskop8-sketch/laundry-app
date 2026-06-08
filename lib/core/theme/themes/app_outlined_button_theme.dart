// =============================================================================
// File        : app_outlined_button_theme.dart
// Path        : lib/core/theme/components/app_outlined_button_theme.dart
// Layer       : Core (Theme Component)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan global theme untuk OutlinedButton
// - Menjaga konsistensi style button outline di seluruh aplikasi
// - Mengatur:
//   - border color
//   - text color
//   - padding
//   - shape
//   - elevation
// - Menggunakan token dari design system aplikasi
// =============================================================================

import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class AppOutlinedButtonTheme {
  static OutlinedButtonThemeData build(ColorScheme scheme) {
    final radius = AppRadius();
    final spacing = AppSpacing();

    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: scheme.primary,
        elevation: 0,
        side: BorderSide(color: scheme.outlineVariant),
        padding: EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius.md),
        ),
      ),
    );
  }
}
