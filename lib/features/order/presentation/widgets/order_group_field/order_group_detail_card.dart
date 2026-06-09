// =============================================================================
// File : order_group_detail_card.dart
// =============================================================================

import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group_entity_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupDetailCard extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupDetailCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: context.spacing.md),
            childrenPadding: EdgeInsets.fromLTRB(
              context.spacing.md,
              0,
              context.spacing.md,
              context.spacing.md,
            ),

            title: Text(
              group.serviceLabel,
              style: context.text.titleMedium!.semiBold.onSurface(context),
            ),

            subtitle: Padding(
              padding: EdgeInsets.only(top: context.spacing.xs),
              child: Wrap(
                spacing: context.spacing.sm,
                runSpacing: context.spacing.xs,
                children: [
                  AppChip(
                    label: group.speedLabel,
                    icon: group.speedIcon,
                    color: group.speedColor(context),
                  ),

                  AppChip(
                    label: group.orderLabel,
                    icon: group.orderIcon,
                    color: group.speedColor(context),
                  ),
                ],
              ),
            ),

            children: [
              if (group.isPcs) ...[
                ...group.items.map(
                  (item) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,

                    title: Text(item.itemName, style: context.text.titleSmall),

                    subtitle: Text(
                      item.formattedQuantityAndPrice,
                      style: context.text.labelMedium,
                    ),

                    trailing: Text(
                      item.formattedSubtotal,
                      style: context.text.labelLarge?.semiBold.primary(context),
                    ),
                  ),
                ),
              ],

              if (group.isKg)
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,

                  title: const Text('Berat Cucian'),

                  subtitle: Text(
                    '${group.weight ?? 0} Kg',
                    style: context.text.labelMedium,
                  ),

                  trailing: Text(
                    group.formattedPrice,
                    style: context.text.labelLarge?.semiBold.primary(context),
                  ),
                ),
            ],
          ),

          const Divider(height: 1),

          ListTile(
            dense: true,

            title: Text('Subtotal', style: context.text.bodyMedium),

            trailing: Text(
              group.formattedSubtotal,
              style: context.text.titleMedium?.semiBold.primary(context),
            ),
          ),
        ],
      ),
    );
  }
}
