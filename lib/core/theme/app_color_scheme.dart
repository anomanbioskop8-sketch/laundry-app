import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';
import 'package:flutter/material.dart';

class AppColorScheme {
  static final ColorScheme light =
      ColorScheme.fromSeed(
        seedColor: AppSemanticColors.primary,
        brightness: Brightness.light,
      ).copyWith(
        primary: AppSemanticColors.primary,
        error: AppSemanticColors.error,
      );

  static final ColorScheme dark =
      ColorScheme.fromSeed(
        seedColor: AppSemanticColors.primary,
        brightness: Brightness.dark,
      ).copyWith(
        primary: AppSemanticColors.primaryDark,
        error: AppSemanticColors.errorDark,
      );
}
