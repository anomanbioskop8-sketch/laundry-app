import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/tokens/app_sizes.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';

class AppFloatingActionButtonTheme {
  const AppFloatingActionButtonTheme._();

  static FloatingActionButtonThemeData build({required ColorScheme cs}) {
    final sizes = AppSizes();
    final radius = AppRadius();

    return FloatingActionButtonThemeData(
      backgroundColor: cs.primary,
      foregroundColor: cs.onPrimary,
      elevation: 3,
      focusElevation: 4,
      hoverElevation: 4,
      highlightElevation: 6,
      splashColor: cs.primary.withValues(alpha: 0.12),
      shape: RoundedRectangleBorder(borderRadius: radius.lg.r),
      sizeConstraints: BoxConstraints(
        minWidth: sizes.buttonLg,
        minHeight: sizes.buttonLg,
      ),

      extendedTextStyle: TextStyle(
        color: cs.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      extendedPadding: EdgeInsets.symmetric(horizontal: sizes.buttonMd / 2),
      enableFeedback: true,
    );
  }
}
