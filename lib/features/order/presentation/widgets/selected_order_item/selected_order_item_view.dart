import 'package:app_laundry/features/order/presentation/widgets/selected_order_item/selected_order_item_list.dart';
import 'package:app_laundry/features/order/presentation/widgets/selected_order_item/selected_order_item_save_button.dart';
import 'package:flutter/material.dart';

class SelectedOrderItemView extends StatelessWidget {
  const SelectedOrderItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: SelectedOrderItemList()),
        SelectedOrderItemSaveButton(),
      ],
    );
  }
}
