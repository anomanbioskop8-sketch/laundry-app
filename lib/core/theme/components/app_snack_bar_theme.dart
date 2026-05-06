import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';

class AppSnackBarTheme {
  const AppSnackBarTheme._();

  static SnackBarThemeData build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    final radius = AppRadius();
    final spacing = AppSpacing();

    return SnackBarThemeData(
      behavior: SnackBarBehavior.floating,

      contentTextStyle: text.bodyMedium?.copyWith(
        color: cs.onInverseSurface,
        fontWeight: FontWeight.w500,
      ),

      actionTextColor: cs.inversePrimary,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.md),
      ),

      elevation: 2,
      showCloseIcon: true,
      closeIconColor: cs.onInverseSurface.withValues(alpha: 0.8),

      /// spacing luar snackbar
      insetPadding: EdgeInsets.symmetric(
        horizontal: spacing.lg,
        vertical: spacing.md,
      ),

      /// width constraint (bagus untuk tablet/web)
      width: 600,
    );
  }
}
