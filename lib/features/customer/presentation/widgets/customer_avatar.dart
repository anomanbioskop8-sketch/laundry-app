import 'package:app_laundry/core/theme/extensions/theme_ext.dart';
import 'package:app_laundry/core/theme/extensions/theme_size_ext.dart';
import 'package:app_laundry/core/theme/helpers/avatar_size_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:flutter/material.dart';

class CustomerAvatar extends StatelessWidget {
  final String initials;
  final Color backgroundColor;
  final double? radius;

  const CustomerAvatar({
    super.key,
    required this.initials,
    required this.backgroundColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final avatarRadius = radius ?? context.sizes.avatarMd.radius;

    return CircleAvatar(
      radius: avatarRadius,
      backgroundColor: backgroundColor,
      child: Text(
        initials,
        style: context.text.titleSmall?.semiBold.onPrimary(context),
      ),
    );
  }
}
