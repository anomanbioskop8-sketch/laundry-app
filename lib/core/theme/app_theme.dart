import 'package:app_laundry/core/theme/app_color_scheme.dart';
import 'package:app_laundry/core/theme/components/app_appbar_theme.dart';
import 'package:app_laundry/core/theme/components/app_bottom_nav_theme.dart';
import 'package:app_laundry/core/theme/components/app_button_theme.dart';
import 'package:app_laundry/core/theme/components/app_input_theme.dart';
import 'package:app_laundry/core/theme/components/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = _theme(AppColorScheme.light);
  static ThemeData dark = _theme(AppColorScheme.dark);

  static ThemeData _theme(ColorScheme scheme) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,

      appBarTheme: AppAppBarTheme.call(scheme),
      bottomNavigationBarTheme: AppBottomNavTheme.call(scheme),
      elevatedButtonTheme: AppButtonTheme.call(scheme),

      inputDecorationTheme: AppInputTheme.call(scheme),
      textTheme: AppTextTheme.call(scheme),
    );
  }
}
