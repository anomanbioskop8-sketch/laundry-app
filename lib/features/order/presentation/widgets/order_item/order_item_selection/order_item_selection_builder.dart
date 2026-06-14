//lib\features\order\presentation\widgets\order_item\order_item_selection\order_item_selection_card\order_item_selection_builder.dart

import 'package:app_laundry/core/extensions/collection/iterable_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_item_selection_state.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_item/order_item_selection/order_item_selection_card/order_item_selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemSelectionBuilder extends StatelessWidget {
  final OrderLaundryItemEntity item;

  const OrderItemSelectionBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderItemSelectionCubit, OrderItemSelectionState>(
      builder: (context, state) {
        final selectedItem = state.selectedItems.firstWhereOrNull(
          (e) => e.itemId == item.itemId,
        );

        return OrderItemSelectionCard(
          item: item,
          isSelected: selectedItem != null,
          qty: selectedItem?.qty ?? 1,
          onSelected: (selected) {
            context.read<OrderItemSelectionCubit>().toggle(item, selected);
          },
          onQtyChanged: (qty) {
            context.read<OrderItemSelectionCubit>().updateQty(item.itemId, qty);
          },
        );
      },
    );
  }
}
