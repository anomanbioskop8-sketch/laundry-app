import 'package:flutter/material.dart';

class AppInputTheme {
  static InputDecorationTheme build(ColorScheme scheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surface,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      // ======================
      // BORDER
      // ======================
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.primary, width: 1.5),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: scheme.error, width: 1.5),
      ),

      // ======================
      // TEXT
      // ======================
      labelStyle: TextStyle(color: scheme.onSurfaceVariant),

      hintStyle: TextStyle(
        color: scheme.onSurfaceVariant.withValues(alpha: 0.6),
      ),

      errorStyle: TextStyle(color: scheme.error),

      // ======================
      // ICON
      // ======================
      prefixIconColor: scheme.onSurfaceVariant,
      suffixIconColor: scheme.onSurfaceVariant,
    );
  }
}
