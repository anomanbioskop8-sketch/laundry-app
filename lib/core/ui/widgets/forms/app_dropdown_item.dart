import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class AppDropdownItem extends StatelessWidget {
  final String label;
  final IconData? icon;

  const AppDropdownItem({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.sm),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: context.colors.primary),
            context.spacing.md.w,
          ],

          Expanded(
            child: Text(
              label,
              style: context.text.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
