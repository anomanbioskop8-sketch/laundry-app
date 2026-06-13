import 'package:app_laundry/core/ui/bottom_sheets/app_action_sheet.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_with_customer/order_with_customer_ext.dart';
import 'package:app_laundry/features/order/presentation/builders/order_action_builder.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_card/order_card.dart';
import 'package:flutter/material.dart';

class OrderCardButton extends StatelessWidget {
  final OrderWithCustomerEntity order;

  const OrderCardButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final actions = OrderActionBuilder.build(context, order.order);

        AppActionSheet.show(
          context,
          title: order.customerNameDisplay,
          actions: actions,
        );
      },
      child: OrderCard(order: order),
    );
  }
}
