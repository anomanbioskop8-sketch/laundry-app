import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData build(ColorScheme scheme) {
    final radius = AppRadius();
    final spacing = AppSpacing();
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.lg,
          vertical: spacing.md,
        ),
        shape: RoundedRectangleBorder(borderRadius: radius.md.r),
      ),
    );
  }
}
