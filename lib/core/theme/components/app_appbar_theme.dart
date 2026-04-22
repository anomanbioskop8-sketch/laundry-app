import 'package:flutter/material.dart';

class AppAppBarTheme {
  static AppBarTheme call(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
    centerTitle: true,
    );
  }
}