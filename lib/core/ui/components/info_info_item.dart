import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

class AppInfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const AppInfoItem({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.spacing.md,
        horizontal: context.spacing.lg,
      ),
      child: Row(
        children: [
          /// ICON
          Container(
            padding: EdgeInsets.all(context.spacing.sm),
            decoration: BoxDecoration(
              color: context.primary.withValues(alpha: 0.2),
              borderRadius: context.radius.md.r,
            ),
            child: Icon(icon, color: context.primary),
          ),

          context.spacing.md.w,

          /// LABEL
          Expanded(flex: 2, child: Text(label, style: context.bodyMedium)),

          /// VALUE
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: context.bodyLarge,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
