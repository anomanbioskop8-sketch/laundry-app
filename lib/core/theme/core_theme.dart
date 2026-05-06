import 'package:app_laundry/core/theme/app_color_scheme.dart';
import 'package:app_laundry/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CoreTheme {
  CoreTheme._();

  static ThemeData light() => AppTheme.build(
    cs: AppColorScheme.light,
    brightness: Brightness.light,
    isDark: false,
  );
  static ThemeData dark() => AppTheme.build(
    cs: AppColorScheme.dark,
    brightness: Brightness.dark,
    isDark: true,
  );
}
