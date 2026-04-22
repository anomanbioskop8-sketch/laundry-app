import 'package:flutter/material.dart';

class AppBottomNavTheme {
  static BottomNavigationBarThemeData call(ColorScheme scheme) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: scheme.surface,

      selectedItemColor: scheme.primary,
      unselectedItemColor: scheme.onSurfaceVariant,

      selectedIconTheme: IconThemeData(
        color: scheme.primary,
        size: 24,
      ),

      unselectedIconTheme: IconThemeData(
        color: scheme.onSurfaceVariant,
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
    );
  }
}