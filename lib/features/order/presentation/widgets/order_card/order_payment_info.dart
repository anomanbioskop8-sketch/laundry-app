import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_payment_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_price_ext.dart';
import 'package:flutter/material.dart';

class OrderPaymentInfo extends StatelessWidget {
  final OrderEntity order;

  const OrderPaymentInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          order.formattedTotal,
          style: context.text.bodyMedium!.semiBold.primary(context),
        ),

        context.spacing.xs.h,

        AppChip(
          label: order.paymentLabel,
          icon: order.paymentIcon,
          color: order.paymentColor(context),
        ),
      ],
    );
  }
}
