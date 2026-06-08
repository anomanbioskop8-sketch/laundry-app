import 'package:app_laundry/core/theme/app_color_scheme.dart';
import 'package:app_laundry/core/theme/app_theme_builder.dart';
import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static ThemeData light() => AppThemeBuilder.build(
    cs: AppColorScheme.light,
    brightness: Brightness.light,
    isDark: false,
  );
  static ThemeData dark() => AppThemeBuilder.build(
    cs: AppColorScheme.dark,
    brightness: Brightness.dark,
    isDark: true,
  );
}
