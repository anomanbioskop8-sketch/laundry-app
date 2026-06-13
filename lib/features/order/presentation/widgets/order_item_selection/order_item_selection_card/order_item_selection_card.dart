import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_laundry_item_entity_ext.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_item_selection/order_item_selection_card/order_item_qty_field.dart';
import 'package:flutter/material.dart';

class OrderItemSelectionCard extends StatelessWidget {
  final OrderLaundryItemEntity item;
  final bool isSelected;
  final int qty;
  final ValueChanged<bool> onSelected;
  final ValueChanged<int> onQtyChanged;

  const OrderItemSelectionCard({
    super.key,
    required this.item,
    required this.isSelected,
    required this.qty,
    required this.onSelected,
    required this.onQtyChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: context.radius.md.r),
      tileColor: context.colors.surfaceContainer,
      contentPadding: EdgeInsets.symmetric(horizontal: context.spacing.md),
      leading: Checkbox(
        value: isSelected,
        onChanged: (value) => onSelected(value == true),
      ),
      title: Text(
        item.itemName,
        style: context.text.titleSmall!.semiBold.onSurface(context),
      ),
      subtitle: Text(
        item.formattedPrice,
        style: context.text.bodyMedium!.onSurfaceVariant(context),
      ),
      trailing: OrderItemQtyField(
        value: qty,
        enabled: isSelected,
        onChanged: onQtyChanged,
      ),
    );
  }
}
