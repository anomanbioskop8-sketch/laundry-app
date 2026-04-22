import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class CoreTheme {
  CoreTheme._();

  static ThemeData light() => LightTheme.build();
  static ThemeData dark() => DarkTheme.build();
}
