import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

class AppSelectedItem extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final VoidCallback? onTap;

  const AppSelectedItem({
    super.key,
    this.leading,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: context.radius.md.r,
      child: ListTile(
        shape: OutlineInputBorder(
          borderRadius: context.radius.md.r,
          borderSide: BorderSide(color: context.colors.outlineVariant),
        ),
        leading: leading,
        title: Text(title, style: titleStyle),
        subtitle: subtitle != null
            ? Text(subtitle!, style: subtitleStyle)
            : null,
      ),
    );
  }
}
