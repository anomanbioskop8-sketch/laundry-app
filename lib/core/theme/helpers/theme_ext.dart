import 'package:app_laundry/core/theme/extensions/app_status_colors.dart';
import 'package:app_laundry/core/theme/tokens/app_radius.dart';
import 'package:app_laundry/core/theme/tokens/app_sizes.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';
import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;
  TextTheme get text => theme.textTheme;

  AppStatusColors get status =>
      theme.extension<AppStatusColors>() ?? AppStatusColors.fallback();

  // Colors
  Color get primary => colors.primary;
  Color get surface => colors.surface;
  //Color get background => colors.background;
  Color get onSurface => colors.onSurface;
  Color get error => colors.error;

  // Typography
  TextStyle? get bodyMedium => text.bodyMedium;
  TextStyle? get titleMedium => text.titleMedium;
  TextStyle? get titleLarge => text.titleLarge;

  // Brightness
  bool get isDark => theme.brightness == Brightness.dark;
  bool get isLight => !isDark;

  // Design Tokens
  AppSpacing get spacing => AppSpacing();
  AppRadius get radius => AppRadius();
  AppSizes get sizes => AppSizes();
}
