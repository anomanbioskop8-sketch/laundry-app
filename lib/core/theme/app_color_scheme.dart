import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  static final ColorScheme light =
      ColorScheme.fromSeed(
        seedColor: AppSemanticColors.primary,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppSemanticColors.primary,
        onSurface: AppSemanticColors.textPrimaryLight,
        onSurfaceVariant: AppSemanticColors.textSecondaryLight,
        error: AppSemanticColors.error,
      );

  static final ColorScheme dark =
      ColorScheme.fromSeed(
        seedColor: AppSemanticColors.primary,
        brightness: Brightness.dark,
      ).copyWith(
        onSurface: AppSemanticColors.textPrimaryDark,
        onSurfaceVariant: AppSemanticColors.textPrimaryDark,
        error: AppSemanticColors.error,
      );
}
