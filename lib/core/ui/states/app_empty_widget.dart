import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:flutter/material.dart';

class AppEmptyWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback? onRetry;

  const AppEmptyWidget({
    super.key,
    this.message = 'Data tidak ditemukan',
    this.icon = Icons.inbox_outlined,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: context.sizes.iconXxl,
            color: context.colors.onSurfaceVariant,
          ),
          context.spacing.md.h,
          Text(message, style: context.bodyMedium),
          if (onRetry != null) ...[
            context.spacing.md.h,
            TextButton(onPressed: onRetry, child: const Text('Coba Lagi')),
          ],
        ],
      ),
    );
  }
}
