// =============================================================================
// File        : app_elevated_action_button.dart
// Path        : lib/core/ui/components/buttons/app_elevated_action_button.dart
// Layer       : Core (Reusable Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Reusable ElevatedButton / ElevatedButton.icon
// - Mendukung action reusable seperti save, submit, confirm, dll
// =============================================================================

import 'package:app_laundry/core/theme/extensions/theme_size_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_text_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:flutter/material.dart';

class AppElevatedActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;

  /// custom background color
  final Color? color;

  /// custom foreground color
  final Color? foregroundColor;

  const AppElevatedActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final style = ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: foregroundColor,
    );

    // =========================
    // WITHOUT ICON
    // =========================
    if (icon == null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(
          label.toUpperCase(),
          style: context.labelLarge?.onPrimary(context),
        ),
      );
    }

    // =========================
    // WITH ICON
    // =========================
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(icon, size: context.sizes.iconMd),
      label: Text(
        label.toUpperCase(),
        style: context.labelLarge?.onPrimary(context),
      ),
    );
  }
}
