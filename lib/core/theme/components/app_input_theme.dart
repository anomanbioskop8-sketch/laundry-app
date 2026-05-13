import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class AppInputTheme {
  const AppInputTheme._();

  static InputDecorationTheme build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    /// 🔥 cache tokens (important)
    final radius = AppRadius();
    final spacing = AppSpacing();

    final base = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius.md),
      borderSide: BorderSide.none,
    );

    return InputDecorationTheme(
      filled: true,
      fillColor: cs.surface,

      isDense: false,
      alignLabelWithHint: true,

      contentPadding: EdgeInsets.symmetric(
        horizontal: spacing.md,
        vertical: spacing.lg,
      ),

      // ======================
      // BORDER
      // ======================
      border: base,

      enabledBorder: base.copyWith(
        borderSide: BorderSide(color: cs.outlineVariant),
      ),

      focusedBorder: base.copyWith(
        borderSide: BorderSide(color: cs.primary, width: 1.5),
      ),

      errorBorder: base.copyWith(borderSide: BorderSide(color: cs.error)),

      focusedErrorBorder: base.copyWith(
        borderSide: BorderSide(color: cs.error, width: 1.5),
      ),

      // ======================
      // TEXT 🔥 (IMPROVED UX)
      // ======================
      labelStyle: text.bodyMedium?.copyWith(
        color: cs.onSurfaceVariant.withValues(alpha: 0.8),
      ),

      floatingLabelStyle: text.bodyMedium?.copyWith(
        color: cs.primary,
        fontWeight: FontWeight.w600,
      ),

      hintStyle: text.bodyMedium?.copyWith(
        color: cs.onSurfaceVariant.withValues(alpha: 0.5),
      ),

      helperStyle: text.bodySmall?.copyWith(
        color: cs.onSurfaceVariant.withValues(alpha: 0.7),
      ),

      errorStyle: text.bodySmall?.copyWith(
        color: cs.error,
        fontWeight: FontWeight.w500,
      ),

      // ======================
      // ICON
      // ======================
      prefixIconColor: cs.onSurfaceVariant,
      suffixIconColor: cs.onSurfaceVariant,

      // ======================
      // LABEL BEHAVIOR 🔥
      // ======================
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    );
  }
}
