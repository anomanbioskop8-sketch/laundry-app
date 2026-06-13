import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_card/order_customer_info.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_card/order_header.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_card/order_payment_info.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderWithCustomerEntity order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: context.spacing.sm),
      child: Padding(
        padding: EdgeInsets.all(context.spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderHeader(order: order.order),
            Divider(height: context.spacing.md),
            Row(
              children: [
                OrderCustomerInfo(order: order),
                OrderPaymentInfo(order: order.order),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
