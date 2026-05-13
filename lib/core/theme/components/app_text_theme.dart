import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme build(ColorScheme scheme) {
    final base = GoogleFonts.poppinsTextTheme();

    // 🔥 Golden Ratio (compressed for mobile)
    const displayLarge = 40.0;
    const headlineLarge = 32.0;
    const headlineMedium = 26.0;
    const headlineSmall = 22.0;

    const titleLarge = 20.0;
    const titleMedium = 18.0;
    const titleSmall = 16.0;

    const bodyLarge = 16.0;
    const bodyMedium = 14.0;
    const bodySmall = 13.0;

    const labelLarge = 14.0;
    const labelMedium = 13.0;
    const labelSmall = 12.0;

    return base.copyWith(
      // =========================
      // DISPLAY
      // =========================
      displayLarge: base.displayLarge?.copyWith(
        fontSize: displayLarge,
        fontWeight: FontWeight.w700,
        color: scheme.onSurface,
      ),

      // =========================
      // HEADLINE
      // =========================
      headlineLarge: base.headlineLarge?.copyWith(
        fontSize: headlineLarge,
        fontWeight: FontWeight.w700,
        color: scheme.onSurface,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontSize: headlineMedium,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontSize: headlineSmall,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),

      // =========================
      // TITLE
      // =========================
      titleLarge: base.titleLarge?.copyWith(
        fontSize: titleLarge,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontSize: titleMedium,
        fontWeight: FontWeight.w500,
        color: scheme.onSurface,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontSize: titleSmall,
        fontWeight: FontWeight.w500,
        color: scheme.onSurfaceVariant,
      ),

      // =========================
      // BODY
      // =========================
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: bodyLarge,
        color: scheme.onSurface,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: bodyMedium,
        color: scheme.onSurface,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontSize: bodySmall,
        color: scheme.onSurfaceVariant,
      ),

      // =========================
      // LABEL (navigation, tab, chip)
      // =========================
      labelLarge: base.labelLarge?.copyWith(
        fontSize: labelLarge,
        fontWeight: FontWeight.w600,
        color: scheme.onPrimary,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontSize: labelMedium,
        color: scheme.onSurface,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontSize: labelSmall,
        color: scheme.onSurfaceVariant,
      ),
    );
  }
}
