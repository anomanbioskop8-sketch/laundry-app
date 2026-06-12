import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_status/order_status_display_ext.dart';
import 'package:flutter/material.dart';

class OrderListHeader extends StatelessWidget {
  final OrderEntity order;

  const OrderListHeader({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            order.invoiceNumber,
            overflow: TextOverflow.ellipsis,
            style: context.text.labelMedium!.semiBold.onSurface(context),
          ),
        ),
        AppChip(
          label: order.orderStatus.label,
          icon: order.orderStatus.icon,
          color: order.orderStatus.color(context),
        ),
      ],
    );
  }
}
