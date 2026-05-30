import 'package:flutter/material.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static TabBarThemeData build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    return TabBarThemeData(
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: cs.primary, width: 3),
      ),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: cs.primary,
      labelStyle: text.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelColor: cs.onSurfaceVariant,
      unselectedLabelStyle: text.labelLarge?.copyWith(
        fontWeight: FontWeight.w500,
      ),
      overlayColor: WidgetStateProperty.all(cs.primary.withValues(alpha: 0.08)),
      splashFactory: InkRipple.splashFactory,
      dividerColor: cs.outlineVariant,
    );
  }
}
