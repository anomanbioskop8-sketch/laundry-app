// =============================================================================
// File        : app_chip.dart
// Path        : lib/core/ui/components/chip/app_chip.dart
// =============================================================================

import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

class AppChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color color;

  const AppChip({
    super.key,
    required this.label,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.spacing.sm,
        vertical: context.spacing.xs,
      ),

      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: context.radius.sm.r,
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,

        children: [
          /// ICON
          if (icon != null) ...[
            Icon(icon, size: context.sizes.iconSm, color: color),
            context.spacing.xs.w,
          ],

          /// LABEL
          Text(label, style: context.labelSmall!.copyWith(color: color)),
        ],
      ),
    );
  }
}
