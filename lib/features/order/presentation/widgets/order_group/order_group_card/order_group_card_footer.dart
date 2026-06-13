import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_price_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_summary_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupCardFooter extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupCardFooter({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          group.summaryDisplay,
          style: context.text.labelMedium?.semiBold.onSurfaceVariant(context),
        ),
        Text(
          group.formattedSubtotal,
          style: context.text.titleSmall?.semiBold.primary(context),
        ),
      ],
    );
  }
}
