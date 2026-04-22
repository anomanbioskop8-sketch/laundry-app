import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme call(ColorScheme scheme) {
    final base = GoogleFonts.poppinsTextTheme();

    return base.copyWith(
      // HEADLINE
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: scheme.onSurface,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),

      // TITLE
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: scheme.onSurface,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: scheme.onSurfaceVariant,
      ),

      // BODY
      bodyLarge: base.bodyLarge?.copyWith(color: scheme.onSurface),
      bodyMedium: base.bodyMedium?.copyWith(color: scheme.onSurface),
      bodySmall: base.bodySmall?.copyWith(color: scheme.onSurfaceVariant),

      // LABEL
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: scheme.onPrimary,
      ),
      labelMedium: base.labelMedium?.copyWith(color: scheme.onSurface),
      labelSmall: base.labelSmall?.copyWith(color: scheme.onSurfaceVariant),
    );
  }
}
