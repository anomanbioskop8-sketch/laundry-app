// =============================================================================
// File : order_group_card.dart
// =============================================================================

import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';

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
      child: ListTile(
        // =========================
        // TITLE
        // =========================
        leading: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
        ),
        title: Text(
          group.title,
          style: context.labelMedium!.semiBold.onSurface(context),
        ),

        // =========================
        // SUBTITLE
        // =========================
        subtitle: Text(
          group.description,
          style: context.labelSmall!.secondary(context),
        ),

        // =========================
        // TRAILING
        // =========================
        trailing: Text(
          group.formattedSubtotal,
          style: context.labelMedium!.primary(context),
        ),
      ),
    );
  }
}
