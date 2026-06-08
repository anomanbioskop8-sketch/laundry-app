import 'package:app_laundry/core/theme/theme_extensions/app_status_colors.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_sizes.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;
  TextTheme get text => theme.textTheme;

  AppSpacing get spacing => AppSpacing();
  AppRadius get radius => AppRadius();
  AppSizes get sizes => AppSizes();

  bool get isDark => theme.brightness == Brightness.dark;
  bool get isLight => !isDark;

  AppStatusColors get status =>
      theme.extension<AppStatusColors>() ?? AppStatusColors.fallback();
}
