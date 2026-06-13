import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/chips/app_chip.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_status_ext.dart';
import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  final OrderEntity order;

  const OrderHeader({super.key, required this.order});

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
          label: order.statusLabel,
          icon: order.statusIcon,
          color: order.statusColor(context),
        ),
      ],
    );
  }
}
