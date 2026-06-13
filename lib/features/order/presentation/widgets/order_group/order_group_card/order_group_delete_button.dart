import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:flutter/material.dart';

class OrderGroupDeleteButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const OrderGroupDeleteButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(AppIcons.delete, color: context.colors.error),
    );
  }
}
