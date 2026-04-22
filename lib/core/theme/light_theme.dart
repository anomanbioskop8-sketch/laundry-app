import 'package:app_laundry/core/theme/app_color_scheme.dart';
import 'package:app_laundry/core/theme/components/app_card_theme.dart';
import 'package:app_laundry/core/theme/factories/app_status_color_factory.dart';
import 'package:app_laundry/core/theme/components/app_appbar_theme.dart';
import 'package:app_laundry/core/theme/components/app_button_theme.dart';
import 'package:app_laundry/core/theme/components/app_input_theme.dart';
import 'package:app_laundry/core/theme/components/app_text_theme.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData build() {
    final colorScheme = AppColorScheme.light;

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,

      scaffoldBackgroundColor: colorScheme.surface,
      dividerColor: colorScheme.outlineVariant,
      visualDensity: VisualDensity.standard,

      extensions: <ThemeExtension<dynamic>>[
        AppStatusColorsFactory.light(colorScheme),
      ],

      appBarTheme: AppAppBarTheme.build(colorScheme),
      elevatedButtonTheme: AppButtonTheme.build(colorScheme),
      inputDecorationTheme: AppInputTheme.build(colorScheme),
      textTheme: AppTextTheme.build(colorScheme),
      cardTheme: AppCardTheme.build(colorScheme),
    );
  }
}
