import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class AppSelectedItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool isSelected;

  const AppSelectedItem({
    super.key,
    this.icon,
    required this.title,
    this.subtitle,

    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: OutlineInputBorder(
        borderRadius: context.radius.md.r,
        borderSide: BorderSide(color: context.colors.outlineVariant),
      ),
      leading: Icon(icon, color: context.colors.primary),
      title: Text(title, style: context.text.bodyLarge!.medium),

      subtitle: Text(
        subtitle!,
        style: context.text.bodyMedium!.onSurfaceVariant(context),
      ),

      onTap: onTap,
    );
  }
}
