import 'package:app_laundry/core/theme/helpers/avatar_size_ext.dart';
import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

class AppAvatarHeader extends StatelessWidget {
  final String name;
  final String? subtitle;
  final String initials;
  final Color backgroundColor;

  final double? radius;
  final TextAlign textAlign;

  const AppAvatarHeader({
    super.key,
    required this.name,
    required this.initials,
    required this.backgroundColor,
    this.subtitle,
    this.radius,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final text = context.text;
    final size = radius ?? context.sizes.avatarLg.radius;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 🔥 AVATAR
        CircleAvatar(
          radius: size,
          backgroundColor: backgroundColor,
          child: Text(
            initials,
            style: text.headlineLarge!.semiBold.onPrimary(
              context,
            ), // 🔥 konsisten colorScheme
          ),
        ),

        context.spacing.md.h,

        // 🔥 TEXT
        Column(
          children: [
            Text(name, textAlign: textAlign, style: text.titleLarge),

            if (subtitle != null) ...[
              context.spacing.xs.h,
              Text(subtitle!, textAlign: textAlign, style: text.titleSmall),
            ],
          ],
        ),
      ],
    );
  }
}
