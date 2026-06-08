// core/ui/widgets/app_icon_avatar.dart

import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/avatar/avatar_size_ext.dart';
import 'package:flutter/material.dart';

class AppIconAvatar extends StatelessWidget {
  final IconData icon;
  final double? radius;
  final Color? backgroundColor;
  final Color? iconColor;

  const AppIconAvatar({
    super.key,
    required this.icon,
    this.radius,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? context.sizes.avatarMd.radius,
      backgroundColor: backgroundColor ?? context.colors.primary,
      child: Icon(icon, color: iconColor ?? context.colors.onPrimary),
    );
  }
}
