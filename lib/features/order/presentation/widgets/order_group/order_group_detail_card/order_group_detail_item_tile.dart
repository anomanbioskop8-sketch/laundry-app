import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupDetailItemTile extends StatelessWidget {
  final OrderLaundryItemEntity item;

  const OrderGroupDetailItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: context.spacing.md),
      title: Text(item.itemName, style: context.text.titleSmall!.semiBold),
      subtitle: Text(
        item.quantityAndPriceDisplay,
        style: context.text.labelMedium!.onSurfaceVariant(context),
      ),
      trailing: Text(
        item.formattedSubtotal,
        style: context.text.labelLarge?.semiBold,
      ),
    );
  }
}
