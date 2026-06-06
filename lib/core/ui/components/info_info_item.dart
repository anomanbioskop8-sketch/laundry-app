import 'package:app_laundry/core/theme/extensions/theme_radius_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_spacing_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_text_ext.dart';
import 'package:app_laundry/core/theme/helpers/radius_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
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
      titleAlignment: ListTileTitleAlignment.center,
      leading: Container(
        padding: EdgeInsets.all(context.spacing.sm),
        decoration: BoxDecoration(
          color: context.colors.primary.withValues(alpha: 0.15),
          borderRadius: context.radius.sm.r,
        ),
        child: Icon(icon, color: context.colors.primary),
      ),
      title: Text(label, style: context.bodyMedium!.onSurfaceVariant(context)),
      subtitle: Text(
        value,
        style: context.bodyLarge!.semiBold.onSurface(context),
      ),
    );
  }
}
