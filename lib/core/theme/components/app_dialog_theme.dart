import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';

class AppDialogTheme {
  const AppDialogTheme._();

  static DialogThemeData build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    final radius = AppRadius();
    final spacing = AppSpacing();

    return DialogThemeData(
      elevation: 0,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.lg),
      ),

      insetPadding: EdgeInsets.symmetric(
        horizontal: spacing.lg,
        vertical: spacing.lg,
      ),

      titleTextStyle: text.titleLarge?.copyWith(
        color: cs.onSurface,
        fontWeight: FontWeight.w600,
      ),

      contentTextStyle: text.bodyMedium?.copyWith(
        color: cs.onSurfaceVariant,
        height: 1.4,
      ),

      actionsPadding: EdgeInsets.fromLTRB(
        spacing.lg,
        0,
        spacing.lg,
        spacing.md,
      ),

      alignment: Alignment.center,

      /// 🔥 Material 3 style surface tint
      surfaceTintColor: cs.surfaceTint,

      /// 🔥 Shadow (soft modern feel)
      shadowColor: cs.shadow,
    );
  }
}
