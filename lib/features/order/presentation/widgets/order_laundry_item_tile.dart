// =============================================================================
// File : order_laundry_item_tile.dart
// =============================================================================

import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
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
        icon: Icon(AppIcons.delete, color: context.colors.error),
      ),

      title: Text(
        item.itemName,
        style: context.text.titleSmall!.semiBold.onSurface(context),
      ),

      subtitle: Text(
        item.formattedQuantityAndPrice,
        style: context.text.bodyMedium!.onSurfaceVariant(context),
      ),

      trailing: Text(
        item.formattedSubtotal,
        style: context.text.titleSmall!.semiBold.primary(context),
      ),
    );
  }
}
