import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/tokens/app_sizes.dart';
import 'package:app_laundry/core/theme/tokens/app_spacing.dart';

class AppDividerTheme {
  const AppDividerTheme._();

  static DividerThemeData build({required ColorScheme cs}) {
    final sizes = AppSizes();
    final spacing = AppSpacing();

    return DividerThemeData(
      color: cs.outlineVariant,
      thickness: sizes.borderThin,
      space: spacing.md,
      indent: 0,
      endIndent: 0,
    );
  }
}
