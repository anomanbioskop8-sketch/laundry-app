// =============================================================================
// File : order_group_card.dart
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group_entity_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupCard extends StatelessWidget {
  final OrderGroupEntity group;
  final VoidCallback? onDelete;

  const OrderGroupCard({super.key, required this.group, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.spacing.md,
          horizontal: context.spacing.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              group.serviceLabel,
              style: context.text.labelLarge!.semiBold.onSurface(context),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppChip(
                      label: group.speedLabel,
                      icon: group.speedIcon,
                      color: group.speedColor(context),
                    ),
                    context.spacing.sm.w,
                    AppChip(
                      label: group.orderLabel,
                      icon: group.orderIcon,
                      color: group.speedColor(context),
                    ),
                  ],
                ),

                IconButton(
                  onPressed: onDelete,
                  icon: Icon(AppIcons.delete, color: context.colors.error),
                ),
              ],
            ),
            context.spacing.md.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  group.description,
                  style: context.text.labelSmall!.onSurfaceVariant(context),
                ),
                Text(
                  group.formattedSubtotal,
                  style: context.text.labelLarge!.primary(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
