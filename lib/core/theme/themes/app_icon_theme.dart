import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/tokens/app_sizes.dart';

class AppIconTheme {
  AppIconTheme._();

  static final sizes = AppSizes();

  /// Default icon (ListTile, general UI)
  static IconThemeData defaultTheme(ColorScheme colors) {
    return IconThemeData(size: sizes.iconMd, color: colors.onSurface);
  }

  /// Primary icon (active / important)
  static IconThemeData primary(ColorScheme colors) {
    return IconThemeData(size: sizes.iconMd, color: colors.primary);
  }

  /// Muted icon (secondary info)
  static IconThemeData muted(ColorScheme colors) {
    return IconThemeData(
      size: sizes.iconMd,
      color: colors.onSurface.withValues(alpha: 0.6),
    );
  }

  /// Small icon (chips, compact UI)
  static IconThemeData small(ColorScheme colors) {
    return IconThemeData(size: sizes.iconSm, color: colors.onSurface);
  }

  /// Large icon (header, empty state)
  static IconThemeData large(ColorScheme colors) {
    return IconThemeData(size: sizes.iconLg, color: colors.primary);
  }
}
