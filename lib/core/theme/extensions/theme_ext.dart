import 'package:app_laundry/core/theme/extensions/app_status_colors.dart';
import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;
  TextTheme get text => theme.textTheme;

  bool get isDark => theme.brightness == Brightness.dark;
  bool get isLight => !isDark;

  AppStatusColors get status =>
      theme.extension<AppStatusColors>() ?? AppStatusColors.fallback();
}
