// =============================================================================
// File : order_group_card.dart
// =============================================================================

import 'package:app_laundry/core/theme/helpers/spacing_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_chip.dart';
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
              style: context.labelLarge!.semiBold.onSurface(context),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppChip(
                      label: group.speedLabel,
                      icon: group.speedIcon,
                      color: group.orderColor(context),
                    ),
                    context.spacing.sm.w,
                    AppChip(
                      label: group.orderLabel,
                      icon: group.orderIcon,
                      color: group.orderColor(context),
                    ),
                  ],
                ),

                IconButton(
                  onPressed: onDelete,
                  icon: Icon(Icons.delete_outline, color: context.error),
                ),
              ],
            ),
            context.spacing.md.h,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  group.description,
                  style: context.labelSmall!.secondary(context),
                ),
                Text(
                  group.formattedSubtotal,
                  style: context.labelLarge!.primary(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
