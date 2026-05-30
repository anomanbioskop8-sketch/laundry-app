import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:flutter/material.dart';

class SelectedOrderItemTile extends StatelessWidget {
  final OrderLaundryItemEntity item;
  final bool isSelected;
  final int qty;
  final ValueChanged<bool> onSelected;
  final ValueChanged<int> onQtyChanged;

  const SelectedOrderItemTile({
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
      leading: Checkbox(
        value: isSelected,
        onChanged: (value) => onSelected(value ?? false),
      ),

      title: Text(item.itemName),

      subtitle: Text(item.price.toStringAsFixed(0)),

      trailing: SizedBox(
        width: 80,
        child: TextFormField(
          enabled: isSelected,
          initialValue: qty.toString(),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          onChanged: (value) {
            onQtyChanged(int.tryParse(value) ?? 1);
          },
        ),
      ),
    );
  }
}
