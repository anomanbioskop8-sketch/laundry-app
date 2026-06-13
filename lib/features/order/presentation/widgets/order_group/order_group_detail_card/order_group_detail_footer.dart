import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_price_ext.dart';
import 'package:flutter/material.dart';

class OrderGroupDetailFooter extends StatelessWidget {
  final OrderGroupEntity group;

  const OrderGroupDetailFooter({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: context.spacing.md),
      title: Text(
        'Subtotal',
        style: context.text.bodyMedium!.onSurfaceVariant(context),
      ),
      trailing: Text(
        group.formattedSubtotal,
        style: context.text.titleMedium?.semiBold.primary(context),
      ),
    );
  }
}
