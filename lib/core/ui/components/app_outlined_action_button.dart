// =============================================================================
// File        : app_outlined_action_button.dart
// Path        : lib/core/ui/components/buttons/app_outlined_action_button.dart
// Layer       : Core (Reusable Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Reusable OutlinedButton / OutlinedButton.icon
// - Mendukung action reusable seperti add, edit, filter, dll
// =============================================================================

import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

class AppOutlinedActionButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;

  const AppOutlinedActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final style = OutlinedButton.styleFrom(
      foregroundColor: color,
      side: BorderSide(color: color ?? context.colors.primary),
    );

    // =========================
    // WITHOUT ICON
    // =========================
    if (icon == null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: Text(label),
      );
    }

    // =========================
    // WITH ICON
    // =========================
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(icon, size: context.sizes.iconMd),
      label: Text(label),
    );
  }
}
