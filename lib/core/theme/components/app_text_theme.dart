import 'package:app_laundry/core/theme/tokens/app_font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme build(ColorScheme scheme) {
    final base = GoogleFonts.robotoTextTheme();

    return base.copyWith(
      // =========================
      // DISPLAY
      // =========================
      displayLarge: base.displayLarge?.copyWith(
        fontSize: AppFontSize.displayLarge,
        fontWeight: FontWeight.w400,
      ),

      // =========================
      // HEADLINE
      // =========================
      headlineLarge: base.headlineLarge?.copyWith(
        fontSize: AppFontSize.headlineLarge,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontSize: AppFontSize.headlineMedium,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontSize: AppFontSize.headlineSmall,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),

      // =========================
      // TITLE
      // =========================
      titleLarge: base.titleLarge?.copyWith(
        fontSize: AppFontSize.titleLarge,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontSize: AppFontSize.titleMedium,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontSize: AppFontSize.titleSmall,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),

      // =========================
      // BODY
      // =========================
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: AppFontSize.bodyLarge,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: AppFontSize.bodyMedium,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontSize: AppFontSize.bodySmall,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),

      // =========================
      // LABEL (navigation, tab, chip)
      // =========================
      labelLarge: base.labelLarge?.copyWith(
        fontSize: AppFontSize.labelLarge,
        fontWeight: FontWeight.w500,
        color: scheme.onSurface,
        letterSpacing: 0.1,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontSize: AppFontSize.labelMedium,
        fontWeight: FontWeight.w500,
        color: scheme.onSurface,
        letterSpacing: 0.5,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontSize: AppFontSize.labelSmall,
        fontWeight: FontWeight.w500,
        color: scheme.onSurface,
        letterSpacing: 0.5,
      ),
    );
  }
}
