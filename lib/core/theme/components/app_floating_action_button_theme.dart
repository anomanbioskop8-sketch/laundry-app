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

      /// 🔥 shadow pakai color scheme
      splashColor: cs.primary.withValues(alpha: 0.12),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.lg),
      ),

      /// size default (regular FAB)
      sizeConstraints: BoxConstraints(
        minWidth: sizes.buttonLg, // 56
        minHeight: sizes.buttonLg,
      ),

      /// icon theme
      iconSize: sizes.iconLg, // 24
      /// extended FAB text style
      extendedTextStyle: TextStyle(
        color: cs.onPrimary,
        fontWeight: FontWeight.w600,
      ),

      /// spacing extended FAB
      extendedPadding: EdgeInsets.symmetric(horizontal: sizes.buttonMd / 2),

      /// 🔥 modern feel
      enableFeedback: true,
    );
  }
}
