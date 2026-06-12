import 'package:app_laundry/core/ui/bottom_sheets/app_action_sheet.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_with_customer_entity_ext.dart';
import 'package:app_laundry/features/order/presentation/builders/order_action_builder.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_list_item/order_list_card.dart';
import 'package:flutter/material.dart';

class OrderListItem extends StatelessWidget {
  final OrderWithCustomerEntity order;

  const OrderListItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final actions = OrderActionBuilder.build(context, order.order);

        AppActionSheet.show(
          context,
          title: order.customerName,
          actions: actions,
        );
      },
      child: OrderListCard(order: order),
    );
  }
}
