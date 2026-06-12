import 'package:app_laundry/core/theme/tokens/app_sizes.dart';
import 'package:flutter/material.dart';

class AppAppBarTheme {
  static AppBarTheme build({required ColorScheme cs, required TextTheme text}) {
    return AppBarTheme(
      backgroundColor: cs.primary,
      foregroundColor: cs.onPrimary,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: AppSizes().buttonXxl,
      titleTextStyle: text.titleLarge?.copyWith(color: cs.onPrimary),
    );
  }
}
