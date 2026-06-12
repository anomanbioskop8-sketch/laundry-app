import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_list_item/order_list_customer_info.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_list_item/order_list_header.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_list_item/order_list_payment_info.dart';
import 'package:flutter/material.dart';

class OrderListCard extends StatelessWidget {
  final OrderWithCustomerEntity order;

  const OrderListCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: context.spacing.md),
      child: Padding(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderListHeader(order: order.order),

            Divider(height: context.spacing.md),

            Row(
              children: [
                OrderListCustomerInfo(order: order),

                OrderListPaymentInfo(order: order),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
