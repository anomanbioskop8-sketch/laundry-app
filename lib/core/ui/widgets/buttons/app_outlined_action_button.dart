// =============================================================================
// File        : app_outlined_action_button.dart
// Path        : lib/core/ui/components/buttons/app_outlined_action_button.dart
// Layer       : Core (Reusable Widget)
// -----------------------------------------------------------------------------
// Fungsi:
// - Reusable OutlinedButton / OutlinedButton.icon
// - Mendukung action reusable seperti add, edit, filter, dll
// =============================================================================

import 'package:app_laundry/core/theme/theme_extensions.dart';
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
      textStyle: context.text.labelLarge?.semiBold,
      minimumSize: Size(100, context.sizes.buttonMd),
      side: BorderSide(color: color ?? context.colors.primary),
      shape: RoundedRectangleBorder(borderRadius: context.radius.md.r),
    );

    // =========================
    // WITHOUT ICON
    // =========================
    if (icon == null) {
      return OutlinedButton(
        onPressed: onPressed,
        style: style,
        child: Text(label.toUpperCase()),
      );
    }

    // =========================
    // WITH ICON
    // =========================
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: style,
      icon: Icon(icon, size: context.sizes.iconMd),
      label: Text(label.toUpperCase()),
    );
  }
}
