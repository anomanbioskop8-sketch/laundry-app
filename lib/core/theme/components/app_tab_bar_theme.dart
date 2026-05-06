import 'package:flutter/material.dart';

class AppTabBarTheme {
  AppTabBarTheme._();

  static TabBarThemeData build({
    required ColorScheme cs,
    required TextTheme text,
  }) {
    return TabBarThemeData(
      // 🔥 Indicator
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: cs.primary, width: 2),
      ),

      indicatorSize: TabBarIndicatorSize.label,

      // 🔥 Label color
      labelColor: cs.onSurface,
      unselectedLabelColor: cs.onSurfaceVariant,

      // 🔥 Text style (pakai AppTextTheme)
      labelStyle: text.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      unselectedLabelStyle: text.labelMedium?.copyWith(
        fontWeight: FontWeight.w500,
      ),

      // 🔥 Interaction
      overlayColor: WidgetStateProperty.all(cs.primary.withValues(alpha: 0.08)),

      splashFactory: InkRipple.splashFactory,

      // 🔥 Divider (M3 style)
      dividerColor: cs.outlineVariant,
    );
  }
}
