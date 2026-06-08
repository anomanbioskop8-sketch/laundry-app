import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/tokens/app_sizes.dart';

class AppNavigationBarTheme {
  const AppNavigationBarTheme._();

  static NavigationBarThemeData build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    final sizes = AppSizes();
    final label = text.labelMedium ?? const TextStyle(fontSize: 12);

    return NavigationBarThemeData(
      height: sizes.buttonLg + 16,
      backgroundColor: cs.surfaceContainer,
      indicatorColor: cs.primary.withValues(alpha: 0.2),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

      /// ======================
      /// LABEL
      /// ======================
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return label.copyWith(
            color: cs.onSurfaceVariant.withValues(alpha: 0.4),
          );
        }

        if (states.contains(WidgetState.selected)) {
          return label.copyWith(color: cs.primary, fontWeight: FontWeight.w600);
        }

        return label.copyWith(color: cs.onSurfaceVariant);
      }),

      /// ======================
      /// ICON
      /// ======================
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return IconThemeData(
            color: cs.onSurfaceVariant.withValues(alpha: 0.4),
            size: sizes.iconMd,
          );
        }

        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: cs.primary, size: sizes.iconMd + 5);
        }

        return IconThemeData(color: cs.onSurfaceVariant, size: sizes.iconMd);
      }),

      /// ======================
      /// INTERACTION
      /// ======================
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return cs.primary.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return cs.primary.withValues(alpha: 0.05);
        }
        return null;
      }),
    );
  }
}
