import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

class AppInputTheme {
  const AppInputTheme._();

  static InputDecorationTheme build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    final radius = AppRadius();
    final spacing = AppSpacing();

    final baseBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius.md),
      borderSide: BorderSide.none,
    );

    final hintTextStyle = text.bodyLarge;
    final labelTextStyle = text.labelLarge;
    final helperTextStyle = text.labelMedium;

    Color disabledColor = cs.onSurfaceVariant.withValues(alpha: 0.4);
    Color normalColor = cs.onSurfaceVariant.withValues(alpha: 0.8);

    return InputDecorationTheme(
      // ======================
      // LAYOUT
      // ======================
      filled: true,
      fillColor: cs.surface,
      isDense: false,
      alignLabelWithHint: true,
      contentPadding: EdgeInsets.symmetric(vertical: spacing.md),

      // ======================
      // BORDER
      // ======================
      border: baseBorder,

      enabledBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: cs.outlineVariant),
      ),

      disabledBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: cs.outlineVariant),
      ),

      focusedBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: cs.primary, width: 1.5),
      ),

      errorBorder: baseBorder.copyWith(borderSide: BorderSide(color: cs.error)),

      focusedErrorBorder: baseBorder.copyWith(
        borderSide: BorderSide(color: cs.error, width: 1.5),
      ),

      // ======================
      // LABEL
      // ======================
      labelStyle: WidgetStateTextStyle.resolveWith((states) {
        return labelTextStyle!.copyWith(
          color: states.contains(WidgetState.disabled)
              ? disabledColor
              : normalColor,
        );
      }),

      floatingLabelBehavior: FloatingLabelBehavior.never,

      // ======================
      // TEXT
      // ======================
      hintStyle: hintTextStyle?.copyWith(
        color: cs.onSurfaceVariant.withValues(alpha: 0.5),
      ),

      helperStyle: helperTextStyle?.copyWith(
        color: cs.onSurfaceVariant.withValues(alpha: 0.7),
      ),

      errorStyle: helperTextStyle?.copyWith(
        color: cs.error,
        fontWeight: FontWeight.w500,
      ),

      // ======================
      // ICON
      // ======================
      prefixIconColor: WidgetStateColor.resolveWith((states) {
        return states.contains(WidgetState.disabled)
            ? disabledColor
            : cs.primary;
      }),
      suffixIconColor: cs.onSurfaceVariant,
    );
  }
}
