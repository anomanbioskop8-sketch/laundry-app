// =============================================================================
// File : order_laundry_item_tile.dart
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';
import 'package:flutter/material.dart';

class OrderLaundryItemTile extends StatelessWidget {
  final OrderLaundryItemEntity item;
  final VoidCallback? onDelete;

  const OrderLaundryItemTile({super.key, required this.item, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: IconButton(
        onPressed: onDelete,
        icon: Icon(AppIcons.delete, color: context.error),
      ),

      title: Text(
        item.itemName,
        style: context.titleSmall!.semiBold.onSurface(context),
      ),

      subtitle: Text(
        item.formattedQuantityAndPrice,
        style: context.bodyMedium!.onSurfaceVariant(context),
      ),

      trailing: Text(
        item.formattedSubtotal,
        style: context.titleSmall!.semiBold.primary(context),
      ),
    );
  }
}
