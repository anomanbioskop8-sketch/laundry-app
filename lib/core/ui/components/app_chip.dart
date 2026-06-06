// =============================================================================
// File        : app_chip.dart
// Path        : lib/core/ui/components/chip/app_chip.dart
// =============================================================================

import 'package:app_laundry/core/theme/extensions/theme_radius_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_size_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_spacing_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_text_ext.dart';
import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
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
        color: color.withValues(alpha: 0.15),
        borderRadius: context.radius.xs.r,
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
          Text(label, style: context.labelMedium!.copyWith(color: color)),
        ],
      ),
    );
  }
}
