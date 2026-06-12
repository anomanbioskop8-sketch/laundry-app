import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_with_customer_entity_ext.dart';
import 'package:flutter/material.dart';

class OrderListPaymentInfo extends StatelessWidget {
  final OrderWithCustomerEntity order;

  const OrderListPaymentInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final paymentStatus = order.order.paymentStatus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          order.formattedTotal,
          style: context.text.bodyMedium!.semiBold.primary(context),
        ),

        context.spacing.xs.h,

        AppChip(
          label: paymentStatus.label,
          icon: paymentStatus.icon,
          color: paymentStatus.color(context),
        ),
      ],
    );
  }
}
