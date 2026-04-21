import 'package:flutter/material.dart';
import 'app_color_scheme.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: AppColorScheme.light,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColorScheme.light.surface,

      selectedItemColor: AppColorScheme.light.primary,
      unselectedItemColor: AppColorScheme.light.onSurfaceVariant,

      selectedIconTheme: IconThemeData(
        color: AppColorScheme.light.primary,
        size: 24,
      ),

      unselectedIconTheme: IconThemeData(
        color: AppColorScheme.light.onSurfaceVariant,
        size: 22,
      ),

      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),

      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
      ),

      showUnselectedLabels: true,
      elevation: 0,
    ),
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: AppColorScheme.dark,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColorScheme.dark.surface,

      selectedItemColor: AppColorScheme.dark.primary,
      unselectedItemColor: AppColorScheme.dark.onSurfaceVariant,

      selectedIconTheme: IconThemeData(
        color: AppColorScheme.dark.primary,
      ),

      unselectedIconTheme: IconThemeData(
        color: AppColorScheme.dark.onSurfaceVariant,
      ),

      showUnselectedLabels: true,
      elevation: 0,
    ),
  );
}