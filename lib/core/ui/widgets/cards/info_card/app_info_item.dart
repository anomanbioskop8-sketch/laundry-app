import 'package:app_laundry/core/theme/theme_extensions.dart';
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
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: context.radius.md.r),
      tileColor: context.colors.surfaceContainer,
      contentPadding: EdgeInsets.symmetric(
        horizontal: context.spacing.md,
        vertical: context.spacing.xs,
      ),
      leading: Container(
        padding: EdgeInsets.all(context.spacing.sm),
        decoration: BoxDecoration(
          color: context.colors.primaryContainer,
          borderRadius: context.radius.sm.r,
        ),
        child: Icon(icon, color: context.colors.onPrimaryContainer),
      ),
      title: Text(
        label,
        style: context.text.bodyMedium!.onSurfaceVariant(context),
      ),
      subtitle: Text(
        value,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: context.text.titleMedium!.semiBold.onSurface(context),
      ),
    );
  }
}
