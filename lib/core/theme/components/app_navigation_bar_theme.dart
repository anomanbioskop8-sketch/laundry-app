import 'package:flutter/material.dart';

class AppNavigationBarTheme {
  static NavigationBarThemeData build(ColorScheme scheme) {
    return NavigationBarThemeData(
      height: 70,

      backgroundColor: scheme.surface,

      indicatorColor: scheme.primary.withValues(alpha: 0.12),

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(color: scheme.primary, fontWeight: FontWeight.w600);
        }
        return TextStyle(color: scheme.onSurfaceVariant);
      }),

      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: scheme.primary);
        }
        return IconThemeData(color: scheme.onSurfaceVariant);
      }),
    );
  }
}
