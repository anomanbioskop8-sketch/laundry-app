import 'package:app_laundry/core/theme/components/app_dialog_theme.dart';
import 'package:app_laundry/core/theme/components/app_divider_theme.dart';
import 'package:app_laundry/core/theme/components/app_floating_action_button_theme.dart';
import 'package:app_laundry/core/theme/components/app_outlined_button_theme.dart';
import 'package:app_laundry/core/theme/components/app_snack_bar_theme.dart';
import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/components/app_appbar_theme.dart';
import 'package:app_laundry/core/theme/components/app_button_theme.dart';
import 'package:app_laundry/core/theme/components/app_card_theme.dart';
import 'package:app_laundry/core/theme/components/app_icon_theme.dart';
import 'package:app_laundry/core/theme/components/app_input_theme.dart';
import 'package:app_laundry/core/theme/components/app_navigation_bar_theme.dart';
import 'package:app_laundry/core/theme/components/app_tab_bar_theme.dart';
import 'package:app_laundry/core/theme/components/app_text_theme.dart';
import 'package:app_laundry/core/theme/factories/app_status_color_factory.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData build({
    required ColorScheme cs,
    required Brightness brightness,
    required bool isDark,
  }) {
    final text = AppTextTheme.build(cs);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: cs,

      /// Base
      scaffoldBackgroundColor: cs.surface,
      dividerColor: cs.outlineVariant,
      visualDensity: VisualDensity.standard,

      /// Extensions
      extensions: [
        isDark
            ? AppStatusColorsFactory.dark(cs)
            : AppStatusColorsFactory.light(cs),
      ],

      /// Typography
      textTheme: text,

      /// Components
      appBarTheme: AppAppBarTheme.build(cs: cs, text: text),
      elevatedButtonTheme: AppButtonTheme.build(cs),
      outlinedButtonTheme: AppOutlinedButtonTheme.build(cs),
      inputDecorationTheme: AppInputTheme.build(cs: cs, text: text),
      cardTheme: AppCardTheme.build(cs),

      navigationBarTheme: AppNavigationBarTheme.build(cs: cs, text: text),

      tabBarTheme: AppTabBarTheme.build(cs: cs, text: text),

      /// Icon Theme (optional per mode)
      iconTheme: AppIconTheme.defaultTheme(cs),
      primaryIconTheme: AppIconTheme.primary(cs),
      dialogTheme: AppDialogTheme.build(cs: cs, text: text),
      snackBarTheme: AppSnackBarTheme.build(cs: cs, text: text),
      floatingActionButtonTheme: AppFloatingActionButtonTheme.build(cs: cs),
      dividerTheme: AppDividerTheme.build(cs: cs),
    );
  }
}
