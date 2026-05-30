import 'package:flutter/material.dart';

class AppAppBarTheme {
  static AppBarTheme build(ColorScheme scheme) {
    return AppBarTheme(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 72,
    );
  }
}
