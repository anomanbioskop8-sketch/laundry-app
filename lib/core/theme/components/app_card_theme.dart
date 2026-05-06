import 'package:app_laundry/core/theme/tokens/app_elevation.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:flutter/material.dart';

class AppCardTheme {
  AppCardTheme._();

  static CardThemeData build(ColorScheme colorScheme) {
    final radius = AppRadius();
    return CardThemeData(
      elevation: AppElevation.low,
      color: colorScheme.surfaceContainer,
      shadowColor: colorScheme.shadow.withValues(alpha: 0.1),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.lg),
      ),

      margin: EdgeInsets.zero,

      clipBehavior: Clip.antiAlias,
    );
  }
}
