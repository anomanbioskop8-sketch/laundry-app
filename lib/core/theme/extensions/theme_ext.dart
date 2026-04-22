import 'package:app_laundry/core/theme/extensions/app_status_colors.dart';
import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;

  TextTheme get text => theme.textTheme;

  // shortcut warna
  Color get primary => colors.primary;
  Color get surface => colors.surface;
  Color get onSurface => colors.onSurface;

  AppStatusColors get status => Theme.of(this).extension<AppStatusColors>()!;
}
