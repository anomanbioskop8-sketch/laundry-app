import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_state.dart';
import 'package:app_laundry/features/order/presentation/widgets/selected_order_item/selected_order_item_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedOrderItemTileBuilder extends StatelessWidget {
  final OrderLaundryItemEntity item;

  const SelectedOrderItemTileBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderItemSelectionCubit, OrderItemSelectionState>(
      builder: (context, state) {
        final cubit = context.read<OrderItemSelectionCubit>();

        final selectedItem = state.selectedItems.where(
          (e) => e.itemId == item.itemId,
        );

        final isSelected = selectedItem.isNotEmpty;

        final qty = isSelected ? selectedItem.first.qty : 1;

        return SelectedOrderItemTile(
          item: item,
          isSelected: isSelected,
          qty: qty,
          onSelected: (selected) => cubit.toggle(item, selected),
          onQtyChanged: (qty) => cubit.updateQty(item.itemId, qty),
        );
      },
    );
  }
}
